//
//  SSCoreDataManager.m
//  SS-iOS-Toolbox
//
//  Created by Benedikt Veith on 29/02/16.
//  Copyright © 2016 Scherer-software. All rights reserved.
//

#import "SSCoreDataManager.h"

@interface SSCoreDataManager ()

@property (nonatomic, strong)  NSManagedObjectModel *managedObjectModel;
@property (nonatomic, strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property NSString *schemaName;

@end

@implementation SSCoreDataManager

@synthesize managedObjectContext=__managedObjectContext;
@synthesize managedObjectModel=__managedObjectModel;
@synthesize persistentStoreCoordinator=__persistentStoreCoordinator;
@synthesize schemaName = _schemaName;

+ (SSCoreDataManager*)sharedCoreDataManager
{
    static SSCoreDataManager *sharedCoreDataManager = nil;
    if (sharedCoreDataManager == nil) {
#warning Add Schema Name
        sharedCoreDataManager = [[SSCoreDataManager alloc] initWithSchemaName:@"Schema-Name"];
    }
    return sharedCoreDataManager;
}

- (SSCoreDataManager*)initWithSchemaName:(NSString*)schemaName
{
    self = [super init];
    if (self) {
        _schemaName = schemaName;
    }
    return self;
}

#pragma mark - Save

- (BOOL)saveMainMoc:(NSError**)error {
    // Make sure this method is only called for the main managed object context
    if (self.managedObjectContext != [SSCoreDataManager sharedCoreDataManager].managedObjectContext) {
        if (*error) {
            //TODO: do some error handling here...
        }
        return NO;
    }
    
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (! managedObjectContext) {
        if (*error) {
            //TODO: do some error handling here...
        }
        return NO;
    }
    
    if ([managedObjectContext hasChanges] && ! [managedObjectContext save:error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be usefulduring development.
        NSLog(@"Unresolved error %@, %@", *error, [*error userInfo]);
        abort();
        return NO;
    }
    
    return YES;
}

+ (BOOL)saveChildManagedObjectContext:(NSManagedObjectContext*)moc error:(NSError**)error
{
    __block BOOL success = NO;
    __block BOOL parentSuccess = YES;
    [moc performBlockAndWait:^{
        // push to parent context and save
        if (! [moc save:error]) {
            success = YES;
            
            if (moc.parentContext) {
                parentSuccess = NO;
                __block NSError *parentError;
                [moc.parentContext performBlockAndWait:^{
                    parentSuccess = [moc.parentContext save:&parentError];
                }];
                
                if (! parentSuccess) {
                    NSLog(@"error saving parent context: %@", [parentError localizedDescription]);
                }
            }
        }
    }];
    
    return success && parentSuccess;
}

- (void)deleteObjects:(NSSet*)objects managedObjectContext:(NSManagedObjectContext*)_moc {
    NSManagedObjectContext *moc = (_moc != nil) ? _moc : [SSCoreDataManager sharedCoreDataManager].managedObjectContext;
    for (NSManagedObject *mo in objects) {
        [moc deleteObject:mo];
    }
}

- (void)deleteOrderedObjects:(NSOrderedSet*)objects managedObjectContext:(NSManagedObjectContext*)_moc {
    NSManagedObjectContext *moc = (_moc != nil) ? _moc : [SSCoreDataManager sharedCoreDataManager].managedObjectContext;
    for (NSManagedObject *mo in objects) {
        [moc deleteObject:mo];
    }
}

/**
 Returns the managed object context for the application.
 If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
 */
- (NSManagedObjectContext*)managedObjectContext
{
    if (__managedObjectContext != nil) {
        return __managedObjectContext;
    }
    
    @synchronized (self) {
        NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
        if (coordinator != nil)
        {
            __managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
            [__managedObjectContext performBlockAndWait:^{
                [__managedObjectContext setPersistentStoreCoordinator:coordinator];
            }];
        }
    }
    self.managedObjectContext.mergePolicy = NSOverwriteMergePolicy;
    return __managedObjectContext;
}

- (NSManagedObjectModel*)managedObjectModel {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    
    if (__managedObjectModel != nil) {
        return __managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:_schemaName withExtension:@"momd"];
    __managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return __managedObjectModel;
}

/**
 Returns the persistent store coordinator for the application.
 If the coordinator doesn't already exist, it is created and the application's store added to it.
 */
- (NSPersistentStoreCoordinator*)persistentStoreCoordinator
{
    if (__persistentStoreCoordinator != nil) {
        return __persistentStoreCoordinator;
    }
    
    NSString *dbFilename = [_schemaName stringByAppendingString:@".sqlite"];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:dbFilename];
    
#ifdef DEBUG
    NSLog(@"%@ - Database path %@", _schemaName, storeURL);
#endif
    
    NSError *error = nil;
    __persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    
    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
                             [NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption,
                             [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
    
    if (! [__persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:options error:&error]) {

        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        
        [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil];
#if DEBUG
        abort();
#endif
    }
    
    return __persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

/**
 Returns the URL to the application's Documents directory.
 */
- (NSURL*)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (void)close
{
    [self.managedObjectContext reset];
    __managedObjectContext = nil;
    __persistentStoreCoordinator = nil;
    __managedObjectModel = nil;
}


@end

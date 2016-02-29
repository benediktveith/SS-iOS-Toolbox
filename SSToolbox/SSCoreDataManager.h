//
//  SSCoreDataManager.h
//  SS-iOS-Toolbox
//
//  Created by Benedikt Veith on 29/02/16.
//  Copyright © 2016 Scherer-software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface SSCoreDataManager : NSObject

@property (nonatomic, strong, readonly) NSManagedObjectContext *managedObjectContext;

/**
 *  Global shared instance which holds the main managed object context
 *
 *  @return BOCoreDataManager
 */
+ (SSCoreDataManager*)sharedCoreDataManager;

/**
 *  Save method to be called if application main managed object should be saved
 *
 *  @param error An optional error pointer for errors
 *
 *  @return Bool value which indicates an error
 */
- (BOOL)saveMainMoc:(NSError**)error;

/**
 *  Used to save a concurrent managed object context and its parent context
 *
 *  @param moc The concurrent managed object where -save should be called
 *  @param error An optional error value
 *
 *  @return BOOL which indicates an error
 */
+ (BOOL)saveChildManagedObjectContext:(NSManagedObjectContext*)moc error:(NSError**)error;

/**
 *  Closes the managed object context, its model and store coordinator
 */
- (void)close;

/**
 *  Deletes a give set of objects from a give managed object context.
 *  If no context is provided we delete the objects on the main MOC
 *
 *  !! SAVE OF MOC MUST BE CALLED BY YOURSELF !!
 *
 *  @param objects set of objects to delete
 *  @param moc     Managed object context in which the objects should be deleted
 */
- (void)deleteObjects:(NSSet*)objects managedObjectContext:(NSManagedObjectContext*)moc;

/**
 *  Deletes a given set of ordered objects from a give managed object context.
 *  If no context is provided we delete the objects on the main MOC
 *
 *  !! SAVE OF MOC MUST BE CALLED BY YOURSELF !!
 *
 *  @param objects set of objects to delete
 *  @param moc     Managed object context in which the objects should be deleted
 */
- (void)deleteOrderedObjects:(NSOrderedSet*)objects managedObjectContext:(NSManagedObjectContext*)moc;

@end

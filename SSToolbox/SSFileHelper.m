//
//  SSFileHelper.m
//  SS-iOS-Toolbox
//
//  Created by Benedikt Veith on 29/02/16.
//  Copyright © 2016 Scherer-software. All rights reserved.
//

#import "SSFileHelper.h"

@implementation SSFileHelper

+ (NSString*)documentsDirectory {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [paths objectAtIndex:0];
}

+ (BOOL)fileExistsAtSubdirectory:(NSString*)subdirectory filename:(NSString*)fileName {
    NSString *documentsDirectory = [SSFileHelper documentsDirectory];
    
    if (subdirectory) {
        documentsDirectory = [documentsDirectory stringByAppendingString:[NSString stringWithFormat:@"/%@", subdirectory]];
    }
    
    NSString *filePath = [documentsDirectory stringByAppendingString:[NSString stringWithFormat:@"/%@", fileName]];
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        return YES;
    }
    return NO;
}

+ (NSString*)saveToDocumentsFolderWithData:(NSData*)data subdirectory:(NSString*)subdirectory filename:(NSString*)filename {
    NSString *documentsDirectory = [SSFileHelper documentsDirectory];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (subdirectory) {
        documentsDirectory = [documentsDirectory stringByAppendingString:[NSString stringWithFormat:@"/%@", subdirectory]];
    }
    
    if (! [fileManager fileExistsAtPath:documentsDirectory isDirectory:nil]) {
        [fileManager createDirectoryAtPath:documentsDirectory withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    NSString *filePath = [documentsDirectory stringByAppendingString:[NSString stringWithFormat:@"/%@", filename]];
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        return filePath;
    }
    
    if (! [data writeToFile:filePath atomically:YES]) {
        return nil;
    }
    
    if (! [[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        return nil;
    }
    
    return [subdirectory stringByAppendingPathComponent:filename];
}

+ (NSString*)fileDocumentsFolderWithSubdirectory:(NSString*)subdirectory filename:(NSString*)filename {
    NSString *documentsDirectory = [SSFileHelper documentsDirectory];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (subdirectory) {
        documentsDirectory = [documentsDirectory stringByAppendingString:[NSString stringWithFormat:@"/%@", subdirectory]];
    }
    
    if (! [fileManager fileExistsAtPath:documentsDirectory isDirectory:nil]) {
        [fileManager createDirectoryAtPath:documentsDirectory withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    NSString *filePath = [documentsDirectory stringByAppendingString:[NSString stringWithFormat:@"/%@", filename]];
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        return filePath;
    }
    
    if (! [[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        return nil;
    }
    
    return [subdirectory stringByAppendingPathComponent:filename];
}

+ (NSArray*)directoryContentWithSubdirectory:(NSString*)subdirectory {
    NSString *documentsDirectory = [SSFileHelper documentsDirectory];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    
    if (subdirectory) {
        documentsDirectory = [documentsDirectory stringByAppendingString:[NSString stringWithFormat:@"/%@", subdirectory]];
    }
    NSArray *customerDirectoryContent = [fileManager contentsOfDirectoryAtPath:documentsDirectory error:&error];
    return customerDirectoryContent;
}

+ (BOOL)removeFileAtPath:(NSString*)path error:(NSError**)error {
    return [[NSFileManager defaultManager] removeItemAtPath:path error:error];
}

@end

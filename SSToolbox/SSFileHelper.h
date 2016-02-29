//
//  SSFileHelper.h
//  SS-iOS-Toolbox
//
//  Created by Benedikt Veith on 29/02/16.
//  Copyright © 2016 Scherer-software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SSFileHelper : NSObject

/**
 *  Documents directory for current application
 *
 *  @return The documents directory
 */
+ (NSString*)documentsDirectory;

/**
 *  Check if File at a Document Directory exists
 *
 *  @param subdirectory The subdirectory where the data is expected
 *  @param fileName     the files Name
 *
 *  @return bool for exist
 */
+ (BOOL)fileExistsAtSubdirectory:(NSString*)subdirectory filename:(NSString*)fileName;

/**
 *  Saves a file to the given directory within the documents folder
 *
 *  @param data         Data to be saved
 *  @param subdirectory The subdirectory where data should be saved
 *  @param filename     Filename for the file
 *
 *  @return Relative path to documents folder
 */
+ (NSString*)saveToDocumentsFolderWithData:(NSData*)data subdirectory:(NSString*)subdirectory filename:(NSString*)filename;

/**
 *  Gets file with name from documents folder
 *
 *  @param subdirectory The subdirectory where data should be saved
 *  @param filename     Filename for the file
 *
 *  @return Relative path to documents folder
 */
+ (NSString*)fileDocumentsFolderWithSubdirectory:(NSString*)subdirectory filename:(NSString*)filename;

/**
 *  Gets all files stored in Directory
 *
 *  @param subdirectory The subdirectory where data may be saved
 *
 *  @return Array with all Object found in Directory
 */
+ (NSArray*)directoryContentWithSubdirectory:(NSString*)subdirectory;

/**
 *  Delete a file at given path
 *
 *  @param path  Path of the file to be delete
 *  @param error optional error
 *
 *  @return bool on succes
 */
+ (BOOL)removeFileAtPath:(NSString*)path error:(NSError**)error;

@end

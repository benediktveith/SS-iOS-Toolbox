//
//  NSObject+SSExtension.h
//  SS-iOS-Toolbox
//
//  Created by Benedikt Veith on 29/02/16.
//  Copyright © 2016 Scherer-software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (SSExtension)

/**
 *  Executes a given block on the main thread
 *
 *  @param block A block to be executed on main thread
 */
- (void)ss_performBlockOnMainThread:(void (^)(void))block;

/**
 *  Executes a given block on a background thread
 *
 *  @param block A block to be executed on a background thread
 */
- (void)ss_performBlockOnBackgroundThread:(void (^)(void))block;

/**
 *  Executes a given block on the main thread after a given delay
 *
 *  @param delayInSeconds Delay in seconds after the block should be executed
 *  @param block          A block to be executed after a given delay
 */
- (void)ss_performBlockOnMainThreadAfterDelay:(double)delayInSeconds block:(void (^)(void))block;

@end

//
//  UIView+SSBackgroundThreadDebugger.m
//  SS-iOS-Toolbox
//
//  Created by Benedikt Veith on 29/02/16.
//  Copyright © 2016 Scherer-software. All rights reserved.
//

#import "UIView+SSBackgroundThreadDebugger.h"
#import "objc/runtime.h"

#ifdef DEBUG

@implementation UIView (SSBackgroundThreadDebugger)

/**
 *  When setAnimationsEnabled: is called, DEBUG_setAnimationsEnabled gets called instead
 */
+ (void)load {
    method_exchangeImplementations(class_getInstanceMethod(object_getClass([self class]), @selector(setAnimationsEnabled:)),
                                   class_getInstanceMethod(object_getClass([self class]), @selector(DEBUG_setAnimationsEnabled:)));
}

/**
 *  Check if called in Background Thread: --> Send error message and start debugging
 *
 *  @param enabled setAnimationsEnabled Value
 */
+ (void)DEBUG_setAnimationsEnabled:(BOOL)enabled {
    if (![NSThread isMainThread]) {
        NSLog(@"##############################");
        NSLog(@"#######Background call!#######");
        NSLog(@"Check Debug Navigator to find UI changes");
        NSLog(@"Dispatch in main queue");
        NSLog(@"##############################");
        NSLog(@"##############################");
        NSLog(@"##############################");
#warning Set Breakpoint if not set
    }
    
    [self DEBUG_setAnimationsEnabled:enabled];
}

@end

#endif

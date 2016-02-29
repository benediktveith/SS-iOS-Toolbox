//
//  SSCurrentViewControllerHelper.h
//  SS-iOS-Toolbox
//
//  Created by Benedikt Veith on 29/02/16.
//  Copyright © 2016 Scherer-software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SSCurrentViewControllerHelper : NSObject

/**
 *  Iterates through ViewController stack
 *
 *  @return Top View Controller
 */
+ (UIViewController*)currentViewController;

@end

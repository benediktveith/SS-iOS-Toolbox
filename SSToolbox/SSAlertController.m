//
//  SSAlertController.m
//  SS-iOS-Toolbox
//
//  Created by Benedikt Veith on 29/02/16.
//  Copyright © 2016 Scherer-software. All rights reserved.
//

#import "SSAlertController.h"
#import "SSCurrentViewControllerHelper.h"

@implementation SSAlertController

+ (void)showAlertWithTitle:(NSString*)title message:(NSString*)message {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
                                                                             message:message
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
    
    [[SSCurrentViewControllerHelper currentViewController] presentViewController:alertController animated:YES completion:nil];
}

@end

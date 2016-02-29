//
//  SSNetworkingMain.h
//  SS-iOS-Toolbox
//
//  Created by Benedikt Veith on 29/02/16.
//  Copyright © 2016 Scherer-software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@interface SSNetworkingMain : NSObject

@property AFHTTPSessionManager *manager;

+ (void)initReachabilityListener;
+ (NSString*)getBaseURL;

@end

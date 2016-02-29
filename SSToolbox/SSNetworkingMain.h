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

/**
 *  AFNetworking checks Internet Connection, sets reachibility status depending on it
 */
+ (void)initReachabilityListener;

/**
 *  Get the Base URL
 *
 *  @return Base URL as String
 */
+ (NSString*)getBaseURL;

@end

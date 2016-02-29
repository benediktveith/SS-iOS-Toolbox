//
//  SSNetworkingMain.m
//  SS-iOS-Toolbox
//
//  Created by Benedikt Veith on 29/02/16.
//  Copyright © 2016 Scherer-software. All rights reserved.
//

#import "SSNetworkingMain.h"

@implementation SSNetworkingMain

- (instancetype)init {
    
    self = [super init];
    if (self) {
        
        NSString *baseURL = [SSNetworkingMain getBaseURL];
    
        _manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:baseURL]];
        
        _manager.requestSerializer = [AFJSONRequestSerializer serializer];
        _manager.responseSerializer = [AFJSONResponseSerializer serializer];
        
        [_manager.requestSerializer setValue:@"API-TOKEN-VALUE" forKey:@"APITOKEN"];
    }
    
    return self;
}

+ (NSString*)getBaseURL {
    //Define Base URL
    NSString *baseURL;
    
    return baseURL;
}

+ (void)initReachabilityListener {
    
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSLog(@"################# Reachability: %@", AFStringFromNetworkReachabilityStatus(status));
    }];
    
}

@end

//
//  AfterPushSDK.h
//  AfterPushSDK
//
//  Created by An Dai on 4/13/15.
//  Copyright (c) 2015 mvillage. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AfterPushSDK : NSObject
+ (instancetype)sharedInstance;
- (void)initWithAppKey:(NSString *)appKey;
- (void)registerDeviceToken:(NSData *)deviceToken;
- (void)notificationHandler:(NSDictionary *) remoteInfo;
@end
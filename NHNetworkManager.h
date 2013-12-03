//
//  NHNetworkManager.h
//  networking
//
//  Created by Ryan Johnson on 11/25/13.
//  Copyright (c) 2013 NHCC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NHNetworkManager : NSObject

+ (instancetype)sharedManager;

- (void) downloadApple;
- (void) downloadGoogle;

@end

//
//  XMPUtils.h
//  XMPToolKitSDK-iOS-Sample
//
//  Created by 石塚隆一 on 2017/09/16.
//  Copyright © 2017年 石塚隆一. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface XMPUtils : NSObject

+ (void)writeRate:(NSString *)rate withFile:(NSString *)path error:(NSError **) error;

+ (NSString *)readRateWithFile:(NSString *)path error:(NSError **)error;

@end

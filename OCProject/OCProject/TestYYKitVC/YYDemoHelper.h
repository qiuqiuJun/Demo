//
//  YYDemoHelper.h
//  OCProject
//
//  Created by DOUBLEQ on 2018/9/4.
//  Copyright © 2018年 wqq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YYKit.h"

@interface YYDemoHelper : NSObject
+ (YYWebImageManager *)avatarImageManager;
+ (UIImage *)imageNamed:(NSString *)name;
+ (YYMemoryCache *)imageCache;
+ (NSBundle *)bundle;
@end

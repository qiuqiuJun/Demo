//
//  Factory.h
//  OCProject
//
//  Created by wqq on 2018/9/2.
//  Copyright © 2018年 wqq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseBreakfast.h"
typedef NS_ENUM(NSInteger,BreakfastType){
    BreakfastType_mantou,
    BreakfastType_youtiao
};
@interface Factory : NSObject
+ (BaseBreakfast *)creatBreakfast:(BreakfastType)type;
@end

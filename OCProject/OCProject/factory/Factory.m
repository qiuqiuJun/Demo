//
//  Factory.m
//  OCProject
//
//  Created by wqq on 2018/9/2.
//  Copyright © 2018年 wqq. All rights reserved.
//

#import "Factory.h"
#import "MantouBreakfast.h"
#import "YoutiaoBreakfast.h"

@implementation Factory
+ (BaseBreakfast *)creatBreakfast:(BreakfastType)type{
    BaseBreakfast *breakfast;
    switch (type) {
        case BreakfastType_mantou:
        {
            breakfast = [[MantouBreakfast alloc] init];
        }
            break;
        case BreakfastType_youtiao:
        {
            breakfast = [[YoutiaoBreakfast alloc] init];
        }
            break;
        default:
            return nil;
            break;
    }
    return breakfast;
}
@end

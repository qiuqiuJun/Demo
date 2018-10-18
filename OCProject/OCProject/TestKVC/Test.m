//
//  Test.m
//  OCProject
//
//  Created by DOUBLEQ on 2018/10/12.
//  Copyright © 2018年 wqq. All rights reserved.
//

#import "Test.h"

@interface Test(){
    NSString *_age;
}
@property (nonatomic,strong)NSString *isName;
@end

@implementation Test

+ (BOOL)accessInstanceVariablesDirectly{
    return NO;
}
- (id)valueForUndefinedKey:(NSString *)key{
    NSLog(@"出现异常-key不存在");
    return nil;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    NSLog(@"出现异常-key不存在");
}
@end

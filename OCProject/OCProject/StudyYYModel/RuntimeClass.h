//
//  RuntimeClass.h
//  OCProject
//
//  Created by DOUBLEQ on 2018/10/16.
//  Copyright © 2018年 wqq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RuntimeClass : NSObject
@property (nonatomic, strong) NSArray *array;

@property (nonatomic, copy) NSString *string;

- (void)method1;

- (void)method2;

+ (void)classMethod1;
@end

//
//  OCProjectTests.m
//  OCProjectTests
//
//  Created by wqq on 2018/8/31.
//  Copyright © 2018年 wqq. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "YYKit.h"
#import "CustomModel.h"
@interface OCProjectTests : XCTestCase

@end

@implementation OCProjectTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
//    CustomModel *model = [[CustomModel alloc] init];
//    model.name= @"张三";
//    model.age = @"30";
//    model.address = @"深圳南山";
    
    NSDictionary *modelDic = @{@"name":@"张三",@"age":@"20",@"address":@"深圳南山"};
    CustomModel *jsonModel = [CustomModel modelWithJSON:modelDic];
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end

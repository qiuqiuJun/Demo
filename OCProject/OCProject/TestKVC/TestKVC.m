//
//  TestKVC.m
//  OCProject
//
//  Created by DOUBLEQ on 2018/10/12.
//  Copyright © 2018年 wqq. All rights reserved.
//

#import "TestKVC.h"
#import "Test.h"
@interface TestKVC ()

@end

@implementation TestKVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    Test *test = Test.new;
    [test setValue:@"123" forKey:@"age"];
    NSString *age = [test valueForKey:@"age"];
    NSLog(@"age===%@",age);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end

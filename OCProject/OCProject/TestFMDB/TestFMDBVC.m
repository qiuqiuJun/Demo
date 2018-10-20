//
//  TestFMDBVC.m
//  OCProject
//
//  Created by wqq on 2018/10/17.
//  Copyright © 2018 wqq. All rights reserved.
//

#import "TestFMDBVC.h"
#import "DBHelper.h"
@interface TestFMDBVC ()

@end

@implementation TestFMDBVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [[DBHelper instance] inesertName:@"张三" age:@"40" address:@"深圳南山"];
    [[DBHelper instance] inesertName:@"张三2" age:@"50" address:@"深圳南山2"];
    [[DBHelper instance] inesertName:@"张三3" age:@"60" address:@"深圳南山3"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

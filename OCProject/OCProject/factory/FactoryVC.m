//
//  FactoryVC.m
//  OCProject
//
//  Created by wqq on 2018/9/2.
//  Copyright © 2018年 wqq. All rights reserved.
//

#import "FactoryVC.h"
#import "BaseBreakfast.h"
#import "UIUtil.h"
#import "Masonry.h"
#import "Factory.h"
@interface FactoryVC ()

@end

@implementation FactoryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *btn1 = [UIUtil btnWithTitle:@"馒头" bgColor:[UIColor lightGrayColor] titleFont:[UIFont systemFontOfSize:13] titleColor:[UIColor blackColor] selecor:@selector(touAction:) target:self];
    btn1.tag = 100;
    [self.view addSubview:btn1];
    __weak typeof(self) weakSelf = self;
    [btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.view);
        make.top.equalTo(weakSelf.view).mas_offset(100);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(40);
    }];
    UIButton *btn2 = [UIUtil btnWithTitle:@"油条" bgColor:[UIColor lightGrayColor] titleFont:[UIFont systemFontOfSize:13] titleColor:[UIColor blackColor] selecor:@selector(touAction:) target:self];
    btn2.tag = 200;
    [self.view addSubview:btn2];
    [btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.view);
        make.top.equalTo(btn1.mas_bottom).mas_offset(50);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(40);
    }];
    
}
- (void)touAction:(UIButton *)sender{
    BreakfastType type;
    switch (sender.tag) {
        case 100:
            type = BreakfastType_mantou;
            break;
        case 200:
            type = BreakfastType_youtiao;
            break;
        default:
            type = BreakfastType_mantou;
            break;
    }
    BaseBreakfast *brakfast = [Factory creatBreakfast:type];
    NSLog(@"%@",[brakfast productName]);
    
    UIAlertController *alertCon = [UIAlertController alertControllerWithTitle:@"哈哈" message:[brakfast productName] preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil];
    [alertCon addAction:okAction];
    [self presentViewController:alertCon animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

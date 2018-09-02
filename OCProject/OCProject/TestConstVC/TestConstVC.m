//
//  TestConstVC.m
//  OCProject
//
//  Created by wqq on 2018/9/2.
//  Copyright © 2018年 wqq. All rights reserved.
//

#import "TestConstVC.h"

@interface TestConstVC ()

@end

@implementation TestConstVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    int a = 10;
    a = 20;
    
    //下面两种写法一样，const 均修饰右边的变量
    int const b = 10;
    const int b2 = 10;
    //b = 20//会报错，不允许修改

    int *p = &a;
    int c = 20;
    p = &c;
    
    
    
    //下面的两种写法一样
    const int *d = p;
    NSLog(@"d===%p",d);
    int const *e = p;
    NSLog(@"d===%p",e);
    //d 和 e的值是一样的
    //*d = 20;//会报错
    //上述const修饰的是（*d）和（*e），所以*d 和 *e的值（指针指向的地址存贮的值）不能修改，但是e和d两个指针变量的值可以修改。
    d = &b;
    e = &b;
    
    
    
    int * const f = &a;
    NSLog(@"f===%p",f);
    //f = &a;//报错，不能修改f的值
    //下面的两种写法一样
    const int *const k = &c;
    NSLog(@"k===%p",k);
    int const *const j = &c;
    NSLog(@"j===%p",j);
//    k = &b;//报错
//    *k = 80;//报错
//    j = &b;//报错
//    *j = 80;//报错
    //上述的两种写法是一样的，第一个const修改的是*k和*j，所以*k和*j不能修改，第二个const修饰的是变量k和j（k和j）都是指针变量，他们的值也不能修改
    [self test:&a];
    
    [self test2:&a];
}
- (void)test:(const int *)ak{
    NSLog(@"ak===%p",ak);
    //*ak = 100;//会报错，const修饰的是（*ak），即 指针变量指向额内存空间存贮的值
    int o = 100;
    ak = &o;//但是可以修改指针的值
    NSLog(@"ak===%p",ak);
}
- (void)test2:(int *const)bk{
    int pp = 100;
    //bk = &pp;//报错，const修饰的是bk指针
    *bk = pp;//但是可以修改bk指针指向的空间存储的值
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end

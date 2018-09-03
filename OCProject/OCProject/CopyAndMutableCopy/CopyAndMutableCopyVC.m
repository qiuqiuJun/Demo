//
//  CopyAndMutableCopyVC.m
//  OCProject
//
//  Created by DOUBLEQ on 2018/9/3.
//  Copyright © 2018年 wqq. All rights reserved.
//

#import "CopyAndMutableCopyVC.h"

@interface CopyAndMutableCopyVC ()

@end

@implementation CopyAndMutableCopyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //非集合对象
    NSString *str = @"jkjskdjks";
    NSString *copyStr = [str copy];
    NSLog(@"str指针指向的对象的地址==%p,str指针的值==%p",str,&str);
    NSLog(@"copyStr指针指向的对象的地址==%p,copyStr指针的值==%p",copyStr,&copyStr);
    /*
     输出结果：
     str指针指向的对象的地址     ==0x109fb7f70,str指针的值     ==0x7ffee5e283f8
     copyStr指针指向的对象的地址 ==0x109fb7f70,copyStr指针的值 ==0x7ffee5e283f0
     结论：对象的内存地址没变，指针地址发生了改变，只拷贝了指针，既：浅拷贝。
     */
    
    NSMutableString *muStr = [NSMutableString stringWithFormat:@"dshjdks"];
    NSString *copyMuStr = [muStr copy];
    NSLog(@"muStr指针指向的对象的地址==%p,muStr指针的值==%p",muStr,&muStr);
    NSLog(@"copyMuStr指针指向的对象的地址==%p,copyMuStr指针的值==%p",copyMuStr,&copyMuStr);
    /*
     输出结果：
     muStr指针指向的对象的地址        ==0x600000649240,muStr指针的值          ==0x7ffeed4173e8
     copyMuStr指针指向的对象的地址    ==0xa736b646a6873647,copyMuStr指针的值  ==0x7ffeed4173e0
     结论：对象的内存地址改变，指针地址发生了改变，既：深拷贝。
     */
    
    
    NSString *str2 = @"jkjskswrewdjks";
    NSString *copyStr2 = [str2 mutableCopy];
    NSLog(@"str2指针指向的对象的地址==%p,str2指针的值==%p",str2,&str2);
    NSLog(@"copyStr2指针指向的对象的地址==%p,copyStr2指针的值==%p",copyStr2,&copyStr2);
    /*
     输出结果：
     str2指针指向的对象的地址         ==0x1084cb030,str2指针的值          ==0x7ffee79163d8
     copyStr2指针指向的对象的地址     ==0x60400044b940,copyStr2指针的值   ==0x7ffee79163d0
     结论：对象的内存地址改变，指针地址发生了改变，既：深拷贝。
     */
    
    NSMutableString *muStr2 = [NSMutableString stringWithFormat:@"dshjsddsddks"];
    NSString *copyMuStr2 = [muStr2 mutableCopy];
    NSLog(@"muStr2指针指向的对象的地址==%p,muStr2指针的值==%p",muStr2,&muStr2);
    NSLog(@"copyMuStr2指针指向的对象的地址==%p,copyMuStr2指针的值==%p",copyMuStr2,&copyMuStr2);
    /*
     输出结果：
     muStr2指针指向的对象的地址       ==0x6040002455b0,muStr2指针的值     ==0x7ffee79163c8
     copyMuStr2指针指向的对象的地址   ==0x604000250da0,copyMuStr2指针的值 ==0x7ffee79163c0
     结论：对象的内存地址改变，指针地址发生了改变，既：深拷贝。
     */
    //结论：
    //1.对于可变字符串不论是copy还是mutableCopy 都是深拷贝；
    //2.非可变字符串，copy为浅拷贝，mutableCopy是深拷贝。
    //3.mutableCopy都是深拷贝。copy需要区分是可变字符串和非可变字符串。
    
    //集合对象
    NSArray *array = @[@"sds",@"ew",@"232"];
    NSArray *copyArray = [array copy];
    NSLog(@"array指针指向的对象的地址==%p,array指针的值==%p",array,&array);
    NSLog(@"copyArray指针指向的对象的地址==%p,copyArray指针的值==%p",copyArray,&copyArray);
    /*
     array指针指向的对象的地址        ==0x60400044f060,array指针的值      ==0x7ffee11ed380
     copyArray指针指向的对象的地址    ==0x60400044f060,copyArray指针的值  ==0x7ffee11ed378
     结论：对象的地址没有改变，指针地址改变，既：浅拷贝
     */
    NSMutableArray *muArray = [NSMutableArray arrayWithObjects:@"wefs",@"werwq",@"dfdt", nil];
    NSMutableArray *copyMuArray = [muArray copy];
    NSLog(@"muArray指针指向的对象的地址==%p,muArray指针的值==%p",muArray,&muArray);
    NSLog(@"copyMuArray指针指向的对象的地址==%p,copyMuArray指针的值==%p",copyMuArray,&copyMuArray);
    /*
     muArray指针指向的对象的地址      ==0x60400044eb80,muArray指针的值        ==0x7ffee11ed370
     copyMuArray指针指向的对象的地址  ==0x60400044ecd0,copyMuArray指针的值    ==0x7ffee11ed368
     结论：对象和指针的地址都发生了改变，既：单层深拷贝
     */
    NSArray *array2 = @[@"dsaf",@"wewr",@"vserty"];
    NSArray *copyArray2 = [array2 mutableCopy];
    NSLog(@"array2指针指向的对象的地址==%p,array2指针的值==%p",array2,&array2);
    NSLog(@"copyArray2指针指向的对象的地址==%p,copyArray2指针的值==%p",copyArray2,&copyArray2);
    /*
     rray2指针指向的对象的地址        ==0x604000654340,array2指针的值     ==0x7ffee11ed360
     copyArray2指针指向的对象的地址   ==0x604000653fb0,copyArray2指针的值 ==0x7ffee11ed358
     结论：对象和指针的地址都发生了改变，既：单层深拷贝
     */
    NSMutableArray *muArray2 = [NSMutableArray arrayWithObjects:@"wesfs",@"werwqe",@"dfdtf", nil];
    NSMutableArray *copyMuArray2 = [muArray2 mutableCopy];
    NSLog(@"muArray2指针指向的对象的地址==%p,muArray2指针的值==%p",muArray2,&muArray2);
    NSLog(@"copyMuArray2指针指向的对象的地址==%p,copyMuArray2指针的值==%p",copyMuArray2,&copyMuArray2);
    
    /*
     muArray2指针指向的对象的地址     ==0x60400044ed00,muArray2指针的值       ==0x7ffee11ed350
     copyMuArray2指针指向的对象的地址 ==0x604000654a30,copyMuArray2指针的值   ==0x7ffee11ed348
     结论：对象和指针的地址都发生了改变，既：单层深拷贝

     */
    
    
    NSString *first = [muArray2 objectAtIndex:0];
    NSString *first2 = [copyMuArray2 objectAtIndex:0];
    
    NSLog(@"first指针指向的对象的地址==%p,first指针的值==%p",first,&first);
    NSLog(@"first2指针指向的对象的地址==%p,first2指针的值==%p",first2,&first2);
    /*
     first指针指向的对象的地址        ==0x105f892d0,first指针的值     ==0x7ffee9e58340
     first2指针指向的对象的地址       ==0x105f892d0,first2指针的值    ==0x7ffee9e58338
     结论：单层深拷贝，没有拷贝内容，只是拷贝了指针。
     */
    
    //结论和字符串的结论类似：
    //1.对于可变数组不论是copy还是mutableCopy 都是单层深拷贝；
    //2.非可变数组，copy为浅拷贝，mutableCopy是单层深拷贝。
    //3.mutableCopy都是单层深拷贝。copy需要区分可变数组和非可变数组。
    
    //注意：上面有“浅拷贝”、“深拷贝”、“单层深拷贝”这三个不同的描述，浅拷贝和深拷贝相对容易理解一些，但是“单层深拷贝”是什么呢，有兴趣的同学可以打印下“单层深拷贝”数组的内容，你会发现数组里面的内容只是指针拷贝，并没有进行内容的拷贝，所以称为“单层深拷贝”
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end

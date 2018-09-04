//
//  FrameModel.h
//  OCProject
//
//  Created by wqq on 2018/9/3.
//  Copyright © 2018年 wqq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YYTextLayout.h"
#import "DataModel.h"
#import "YYKit.h"

@interface ItemLayout : NSObject

#define kTopMargin 10
#define kBottomMargin 10
#define kLeftMargin 15
#define kRightMargin 15
#define kMaxLayout ([UIScreen mainScreen].bounds.size.width - kLeftMargin - kRightMargin)
#define kWBCellProfileHeight 56 // cell 名片高度

//个人资料
@property (nonatomic, assign) CGFloat profileHeight; //个人资料高度(包括留白)
@property (nonatomic, strong) YYTextLayout *nameTextLayout; // 名字
@property (nonatomic, strong) YYTextLayout *signLayout; //签名
//文本信息
@property (strong, nonatomic, readonly) YYTextLayout *textLayout;
@property (assign, nonatomic, readonly) CGRect userInfoFrame;
@property (assign, nonatomic, readonly) CGRect texFrame;
//cell高度
@property (assign, nonatomic, readonly) CGFloat cellHeight;

//数据源
@property (strong, nonatomic) DataModel *dataModel;

@end

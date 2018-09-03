//
//  FrameModel.h
//  OCProject
//
//  Created by wqq on 2018/9/3.
//  Copyright © 2018年 wqq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YYTextLayout.h"
@interface FrameModel : NSObject
@property (strong, nonatomic, readonly) YYTextLayout *yyLayout;
@property (assign, nonatomic, readonly) CGRect texFrame;
@property (assign, nonatomic, readonly) CGFloat cellHeight;
@property (strong, nonatomic) NSString *textStr;
@end

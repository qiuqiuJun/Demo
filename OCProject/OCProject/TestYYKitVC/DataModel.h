//
//  DataModel.h
//  OCProject
//
//  Created by DOUBLEQ on 2018/9/4.
//  Copyright © 2018年 wqq. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface DataModel : NSObject
@property (strong, nonatomic) NSString *iconUrlStr;
@property (strong, nonatomic) NSString *userName;
@property (strong, nonatomic) NSString *sign;
@property (strong, nonatomic) NSString *textContent;
@property (strong, nonatomic) NSString *verifyType;//@"0"没认证；@“1”认证用户

@end

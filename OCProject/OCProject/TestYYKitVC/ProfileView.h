//
//  ProfileView.h
//  OCProject
//
//  Created by DOUBLEQ on 2018/9/4.
//  Copyright © 2018年 wqq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYKit.h"
@interface ProfileView : UIView
@property (nonatomic, strong) UIImageView *avatarView; ///< 头像
@property (nonatomic, strong) UIImageView *avatarBadgeView; ///< 徽章
@property (nonatomic, strong) YYLabel *nameLabel;
@property (nonatomic, strong) YYLabel *sourceLabel;
@property (nonatomic, strong) UIImageView *backgroundImageView;
@property (nonatomic, strong) UIButton *arrowButton;
@property (nonatomic, strong) UIButton *followButton;
@end

//
//  FrameModel.m
//  OCProject
//
//  Created by wqq on 2018/9/3.
//  Copyright © 2018年 wqq. All rights reserved.
//

#import "FrameModel.h"
#import "NSAttributedString+YYText.h"
@implementation FrameModel
- (void)setTextStr:(NSString *)str{
    if (!str) {
        return;
    }
    _textStr = str;
    
    CGFloat maxLayout = [UIScreen mainScreen].bounds.size.width - 30;
    CGFloat top  = 10;
    CGFloat bottom = 10;
    NSMutableAttributedString *muattr = [[NSMutableAttributedString alloc] initWithString:_textStr];
    muattr.font = [UIFont systemFontOfSize:20];
    muattr.color = [UIColor yellowColor];
    YYTextContainer *container = [YYTextContainer containerWithSize:CGSizeMake(maxLayout, CGFLOAT_MAX)];
    _yyLayout = [YYTextLayout layoutWithContainer:container text:muattr];
    CGSize textSize = _yyLayout.textBoundingSize;
    _texFrame = CGRectMake(15, top, textSize.width, textSize.height);
    _cellHeight = textSize.height + top + bottom;

}
@end

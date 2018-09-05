//
//  FrameModel.m
//  OCProject
//
//  Created by wqq on 2018/9/3.
//  Copyright © 2018年 wqq. All rights reserved.
//

#import "ItemLayout.h"
#import "NSAttributedString+YYText.h"
#import "NSBundle+YYAdd.h"
#import "YYImageCoder.h"
#import "YYDemoHelper.h"
@implementation ItemLayout
- (void)setDataModel:(DataModel *)model{
    if (!model) {
        return;
    }
    _dataModel = model;
    //用户资料
    [self layoutProfile];
    //文本
    [self layoutText];
}
- (void)layoutProfile{
    if (_dataModel.userName.length == 0) {
        _nameTextLayout = nil;
        return;
    }
    NSMutableAttributedString *nameAtt = [[NSMutableAttributedString alloc] initWithString:_dataModel.userName];
    if ([_dataModel.verifyType isEqualToString:@"0"]) {
        UIImage *blueImage = [YYDemoHelper imageNamed:@"avatar_enterprise_vip"];
        NSAttributedString *blueVText = [self _attachmentWithFontSize:16 image:blueImage shrink:NO];
        [nameAtt appendString:@" "];
        [nameAtt appendAttributedString:blueVText];
    }else{
        UIImage *yellowImage = [YYDemoHelper imageNamed:@"common_icon_membership_level1"];
        NSAttributedString *yellowVText = [self _attachmentWithFontSize:16 image:yellowImage shrink:NO];
        [nameAtt appendString:@" "];
        [nameAtt appendAttributedString:yellowVText];
    }
    nameAtt.font = [UIFont systemFontOfSize:16];
    nameAtt.color = UIColorHex(f26220);
    nameAtt.lineBreakMode = NSLineBreakByCharWrapping;
    YYTextContainer *containner = [YYTextContainer containerWithSize:CGSizeMake((kScreenWidth - 110), 9999)];
    containner.maximumNumberOfRows = 1;
    _nameTextLayout = [YYTextLayout layoutWithContainer:containner text:nameAtt];
    
//    NSLog(@"_nameTextLayout-textBoundingSize.height==%f",_nameTextLayout.textBoundingSize.height);
//    NSLog(@"frame==%@",NSStringFromCGRect(_nameTextLayout.textBoundingRect));

    NSMutableAttributedString *signttr = [[NSMutableAttributedString alloc] initWithString:_dataModel.sign];
    signttr.font = [UIFont systemFontOfSize:15];
    signttr.color = [UIColor blackColor];
    YYTextContainer *signContainer = [YYTextContainer containerWithSize:CGSizeMake((kScreenWidth - 110), CGFLOAT_MAX)];
    signContainer.maximumNumberOfRows = 1;
    _signLayout = [YYTextLayout layoutWithContainer:signContainer text:signttr];
//    NSLog(@"_signLayout-textBoundingSize.height==%f",_signLayout.textBoundingSize.height);
//    NSLog(@"frame2==%@",NSStringFromCGRect(_signLayout.textBoundingRect));
    _profileHeight = kWBCellProfileHeight;
    
//    _cellHeight = kWBCellProfileHeight + kTopMargin + kBottomMargin;

}
- (void)layoutText{
    //text
    NSMutableAttributedString *muattr = [[NSMutableAttributedString alloc] initWithString:_dataModel.textContent];
    muattr.font = [UIFont systemFontOfSize:15];
    muattr.color = [UIColor blackColor];
    YYTextContainer *container = [YYTextContainer containerWithSize:CGSizeMake(kMaxLayout, CGFLOAT_MAX)];
    _textLayout = [YYTextLayout layoutWithContainer:container text:muattr];
    CGSize textSize = _textLayout.textBoundingSize;
    _texFrame = CGRectMake(kLeftMargin, kWBCellProfileHeight + kTopMargin, kMaxLayout, textSize.height);
    //
    _cellHeight  = kTopMargin + kBottomMargin + textSize.height + _profileHeight + kTopMargin;
}


- (NSAttributedString *)_attachmentWithFontSize:(CGFloat)fontSize image:(UIImage *)image shrink:(BOOL)shrink {
    // Heiti SC 字体。。
    CGFloat ascent = fontSize * 0.86;
    CGFloat descent = fontSize * 0.14;
    CGRect bounding = CGRectMake(0, -0.14 * fontSize, fontSize, fontSize);
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(ascent - (bounding.size.height + bounding.origin.y), 0, descent + bounding.origin.y, 0);
    
    YYTextRunDelegate *delegate = [YYTextRunDelegate new];
    delegate.ascent = ascent;
    delegate.descent = descent;
    delegate.width = bounding.size.width;
    
    YYTextAttachment *attachment = [YYTextAttachment new];
    attachment.contentMode = UIViewContentModeScaleAspectFit;
    attachment.contentInsets = contentInsets;
    attachment.content = image;
    
    if (shrink) {
        // 缩小~
        CGFloat scale = 1 / 10.0;
        contentInsets.top += fontSize * scale;
        contentInsets.bottom += fontSize * scale;
        contentInsets.left += fontSize * scale;
        contentInsets.right += fontSize * scale;
        contentInsets = UIEdgeInsetPixelFloor(contentInsets);
        attachment.contentInsets = contentInsets;
    }
    
    NSMutableAttributedString *atr = [[NSMutableAttributedString alloc] initWithString:YYTextAttachmentToken];
    [atr setTextAttachment:attachment range:NSMakeRange(0, atr.length)];
    CTRunDelegateRef ctDelegate = delegate.CTRunDelegate;
    [atr setRunDelegate:ctDelegate range:NSMakeRange(0, atr.length)];
    if (ctDelegate) CFRelease(ctDelegate);
    
    return atr;
}

@end

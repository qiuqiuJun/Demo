//
//  MakeQRVC.m
//  OCProject
//
//  Created by DOUBLEQ on 2018/9/6.
//  Copyright © 2018年 wqq. All rights reserved.
//

#import "MakeQRVC.h"

@interface MakeQRVC ()
@property (weak, nonatomic) IBOutlet UIButton *addImageBtn;
@property (weak, nonatomic) IBOutlet UIButton *makeQRBtn;
@property (weak, nonatomic) IBOutlet UIImageView *QRImageView;

@end

@implementation MakeQRVC

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (IBAction)addImageAction:(id)sender {
    UIImage *image = [UIImage imageNamed:@"appicon.jpg"];
    UIImage *newImage =  [self insertLogoInQrCodeImage:self.QRImageView.image logoImage:image];
    self.QRImageView.image  = newImage;
}
- (IBAction)makeQRAction:(id)sender {
    [self createQrCode:@"猜猜内容是什么？" qrColor:[UIColor blackColor]];
}
- (void)createQrCode:(NSString *)informationString qrColor:(UIColor *)color{
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [filter setDefaults];
    NSData *data = [informationString dataUsingEncoding:NSUTF8StringEncoding];
    [filter setValue:data forKey:@"inputMessage"];
    CIImage *outputImage = [filter outputImage];
    //5.设置二维码的前景色和背景颜色
    CIFilter *colorFilter=[CIFilter filterWithName:@"CIFalseColor"];
    //5.1设置默认值
    [colorFilter setDefaults];
    [colorFilter setValue:outputImage forKey:@"inputImage"];
    
    UIImage *image = [UIImage imageNamed:@"57DC55C0-E73B-4962-AA34-C8C66AF2EC5C"];
    UIColor *bgColor = [self mostColor:image];
    
    [colorFilter setValue:[CIColor colorWithCGColor:[UIColor blackColor].CGColor] forKey:@"inputColor0"];//[CIColor colorWithRed:0 green:0 blue:255]

    [colorFilter setValue:[CIColor colorWithCGColor:bgColor.CGColor] forKey:@"inputColor1"];//[CIColor colorWithRed:1 green:1 blue:1]
//    [colorFilter setValue:bgColor forKey:@"inputColor1"];
    //5.3获取生存的图片
    outputImage=colorFilter.outputImage;
    
    CGAffineTransform scale=CGAffineTransformMakeScale(10, 10);
    outputImage=[outputImage imageByApplyingTransform:scale];
    
    //self.qrCodeImageView.image = [UIImage imageWithCIImage:outputImage];
    [self sharpenQrCodeIamge:outputImage];
}
//- (void)createColorQrCode:(NSString *)informationString{
//    CIFilter *colorFilter=[CIFilter filterWithName:@"CIFalseColor"];
//    [colorFilter setValue:ciImg forKey:@"inputImage"];
//    [colorFilter setValue:[CIColor colorWithRed:0 green:0 blue:255] forKey:@"inputColor0"];
//    [colorFilter setValue:[CIColor colorWithRed:1 green:1 blue:1] forKey:@"inputColor1"];
//    //5.3获取生存的图片
//
//}
//清晰化生成的二维码
- (void)sharpenQrCodeIamge:(CIImage *)image {
    CGFloat scaleX = self.QRImageView.frame.size.width / image.extent.size.width;
    CGFloat scaleY = self.QRImageView.frame.size.height / image.extent.size.height;
    image = [image imageByApplyingTransform:CGAffineTransformMakeScale(scaleX, scaleY)];
    self.QRImageView.image = [UIImage imageWithCIImage:image scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp];
}
- (UIImage *)insertLogoInQrCodeImage:(UIImage *)qrCodeImage logoImage:(UIImage *)logoImage {
    //使用mainScreen的scale，否则会模糊
    UIGraphicsBeginImageContextWithOptions(qrCodeImage.size, NO, [[UIScreen mainScreen] scale]);
    [qrCodeImage drawInRect:CGRectMake(0, 0, qrCodeImage.size.width, qrCodeImage.size.height)];
    CGFloat logoImageX = (qrCodeImage.size.width - 20) / 2;
    CGFloat logoImageY = (qrCodeImage.size.height - 20) / 2;
    CGFloat logoImageWidth = 20;
    CGFloat logoImageHeight = 20;
    [logoImage drawInRect:CGRectMake(logoImageX, logoImageY, logoImageWidth, logoImageHeight)];
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultImage;
}
-(UIColor*)mostColor:(UIImage*)image{
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1
    int bitmapInfo = kCGBitmapByteOrderDefault | kCGImageAlphaPremultipliedLast;
#else
    int bitmapInfo = kCGImageAlphaPremultipliedLast;
#endif
    //第一步 先把图片缩小 加快计算速度. 但越小结果误差可能越大
    CGSize thumbSize=CGSizeMake(image.size.width/2, image.size.height/2);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL,
                                                 thumbSize.width,
                                                 thumbSize.height,
                                                 8,//bits per component
                                                 thumbSize.width*4,
                                                 colorSpace,
                                                 bitmapInfo);
    
    CGRect drawRect = CGRectMake(0, 0, thumbSize.width, thumbSize.height);
    CGContextDrawImage(context, drawRect, image.CGImage);
    CGColorSpaceRelease(colorSpace);
    
    //第二步 取每个点的像素值
    unsigned char* data = CGBitmapContextGetData (context);
    if (data == NULL) return nil;
    NSCountedSet *cls=[NSCountedSet setWithCapacity:thumbSize.width*thumbSize.height];
    
    for (int x=0; x<thumbSize.width; x++) {
        for (int y=0; y<thumbSize.height; y++) {
            int offset = 4*(x*y);
            int red = data[offset];
            int green = data[offset+1];
            int blue = data[offset+2];
            int alpha =  data[offset+3];
            if (alpha>0) {//去除透明
                if (red==255&&green==255&&blue==255) {//去除白色
                }else{
                    NSArray *clr=@[@(red),@(green),@(blue),@(alpha)];
                    [cls addObject:clr];
                }
                
            }
        }
    }
    CGContextRelease(context);
    //第三步 找到出现次数最多的那个颜色
    NSEnumerator *enumerator = [cls objectEnumerator];
    NSArray *curColor = nil;
    NSArray *MaxColor=nil;
    NSUInteger MaxCount=0;
    while ( (curColor = [enumerator nextObject]) != nil )
    {
        NSUInteger tmpCount = [cls countForObject:curColor];
        if ( tmpCount < MaxCount ) continue;
        MaxCount=tmpCount;
        MaxColor=curColor;
        
    }
    return [UIColor colorWithRed:([MaxColor[0] intValue]/255.0f) green:([MaxColor[1] intValue]/255.0f) blue:([MaxColor[2] intValue]/255.0f) alpha:([MaxColor[3] intValue]/255.0f)];
}

-(UIColor*)mostColor{
    
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1
    int bitmapInfo = kCGBitmapByteOrderDefault | kCGImageAlphaPremultipliedLast;
#else
    int bitmapInfo = kCGImageAlphaPremultipliedLast;
#endif
    
    //第一步 先把图片缩小 加快计算速度. 但越小结果误差可能越大
    CGSize thumbSize=CGSizeMake(50, 50);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL,
                                                 thumbSize.width,
                                                 thumbSize.height,
                                                 8,//bits per component
                                                 thumbSize.width*4,
                                                 colorSpace,
                                                 bitmapInfo);
    
    CGRect drawRect = CGRectMake(0, 0, thumbSize.width, thumbSize.height);
    UIImage *image = [UIImage imageNamed:@"31962A89-3740-4802-9CB4-25D450E856C5"];
    CGContextDrawImage(context, drawRect, image.CGImage);
    CGColorSpaceRelease(colorSpace);
    
    
    
    //第二步 取每个点的像素值
    unsigned char* data = CGBitmapContextGetData (context);
    
    if (data == NULL) return nil;
    
    NSCountedSet *cls=[NSCountedSet setWithCapacity:thumbSize.width*thumbSize.height];
    
    for (int x=0; x<thumbSize.width; x++) {
        for (int y=0; y<thumbSize.height; y++) {
            
            int offset = 4*(x*y);
            
            int red = data[offset];
            int green = data[offset+1];
            int blue = data[offset+2];
            int alpha =  data[offset+3];
            
            NSArray *clr=@[@(red),@(green),@(blue),@(alpha)];
            [cls addObject:clr];
            
        }
    }
    CGContextRelease(context);
    
    
    //第三步 找到出现次数最多的那个颜色
    NSEnumerator *enumerator = [cls objectEnumerator];
    NSArray *curColor = nil;
    
    NSArray *MaxColor=nil;
    NSUInteger MaxCount=0;
    
    while ( (curColor = [enumerator nextObject]) != nil )
    {
        NSUInteger tmpCount = [cls countForObject:curColor];
        
        if ( tmpCount < MaxCount ) continue;
        
        MaxCount=tmpCount;
        MaxColor=curColor;
        
    }
    
    return [UIColor colorWithRed:([MaxColor[0] intValue]/255.0f) green:([MaxColor[1] intValue]/255.0f) blue:([MaxColor[2] intValue]/255.0f) alpha:([MaxColor[3] intValue]/255.0f)];
}
@end

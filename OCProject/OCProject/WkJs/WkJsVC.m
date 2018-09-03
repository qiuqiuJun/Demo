//
//  WkJsVC.m
//  StudyDemo
//
//  Created by DOUBLEQ on 2018/9/1.
//  Copyright © 2018年 DOUBLE Q. All rights reserved.
//

#import "WkJsVC.h"
#import <WebKit/WebKit.h>
@interface WkJsVC ()<WKNavigationDelegate,WKUIDelegate,WKScriptMessageHandler>
@property (strong, nonatomic) WKWebView *wkweb;

@end

@implementation WkJsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self testWKJS];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)testWKJS{
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    [config.userContentController addScriptMessageHandler:self name:@"webViewApp22"];
    self.wkweb = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)-300) configuration:config];
    self.wkweb.UIDelegate = self;
    [self.view addSubview:self.wkweb];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"]]];
    [self.wkweb loadRequest:request];
    
    NSArray *titles = [NSArray  arrayWithObjects:@"app调用js方法",@"app调用js并传值",@"app调用js并获取值", nil];
    for (NSInteger i = 0; i < 3; i ++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor = [UIColor lightGrayColor];
        [btn setTitle:titles[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        btn.titleLabel.font  = [UIFont systemFontOfSize:10];
        btn.frame = CGRectMake(10 + (100 + 30)*i, CGRectGetHeight(self.view.frame)-100, 100, 30);
        btn.tag = 100+i;
        btn.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
        [self.view addSubview:btn];
    }

}
//app注册方法后，js调用ios的委托
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message{
    NSDictionary *body = (NSDictionary *)message.body;
    if (body && [body isKindOfClass:[NSDictionary class]]) {
        NSString *method = [NSString stringWithFormat:@"%@",body[@"method"]];
        NSString *param1 = [NSString stringWithFormat:@"%@",body[@"param1"]];
        if ([method isEqualToString:@"hello"]) {
            [self hello:param1];
        }
    }
}
//js端的alert需要客户端协助才能弹框，其实就是js告诉客户端我要弹框了，然后客户端负责实现弹框。
- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler{
    completionHandler();
    UIAlertController *alertCon = [UIAlertController alertControllerWithTitle:@"客户端弹框" message:message preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

    }];
    UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"cancle" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {

    }];
    [alertCon addAction:ok];
    [alertCon addAction:cancle];
    [self presentViewController:alertCon animated:YES completion:nil];
}
- (void)btnAction:(UIButton *)sender{
    switch (sender.tag) {
        case 100:
        {
            [self.wkweb evaluateJavaScript:@"hi()" completionHandler:nil];

        }
            break;
        case 101:
        {
            [self.wkweb evaluateJavaScript:@"hello('wqq')" completionHandler:nil];

        }
            break;
        case 102:
        {
            [self.wkweb evaluateJavaScript:@"getName()" completionHandler:^(id _Nullable result, NSError * _Nullable error) {
                NSLog(@"result===%@",result);
            }];
        }
            break;
        default:
            break;
    }
}
//js调用本地方法
-(void)hello:(NSString *)name{
    NSLog(@"js-调用本地方法-name=%@",name);
}
@end

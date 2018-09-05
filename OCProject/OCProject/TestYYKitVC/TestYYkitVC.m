//
//  TestYYkitVC.m
//  OCProject
//
//  Created by wqq on 2018/9/3.
//  Copyright © 2018年 wqq. All rights reserved.
//

#import "TestYYkitVC.h"
#import "YYLabel.h"
#import "ItemLayout.h"
#import "DataModel.h"
#import "NSObject+YYModel.h"
#import "ProfileView.h"
#import "YYDemoHelper.h"
#import "YYTableView.h"
#import "YYTableViewCell.h"
#import "Masonry.h"
@interface TestYYkitVC ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) NSMutableArray *dataArr;
@property (strong, nonatomic) UITableView *tableView;
@end

@implementation TestYYkitVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView = [UITableView new];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
//    self.tableView.frame = self.view.frame;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    [self.view addSubview:self.tableView];
    __weak typeof(self) weakSelf = self;
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(weakSelf.view);
    }];
    
    self.dataArr = @[].mutableCopy;
    NSArray *nameArr = @[@"张三",@"王大拿",@"王小贱",@"逗你玩",@"绿豆蛙",@"大嘴巴",@"小蛮腰",@"抠脚汉",@"后来",@"天亮以后"];
    NSArray *iconArr = @[@"http://alcache.idianyou.cn/dianyou/data/circle/img/20180316/ff808081622ca9fe01622ccdea801782.png",
                         @"http://alcache.idianyou.cn/dianyou/data/dianyou/img/20180723/ff80808164c786b3016503a49e840054.jpg",
                         @"http://alcache.idianyou.cn/dianyou/data/circle/img/20180316/ff808081622ca9fe01622cc13755099f.png",
                         @"http://alcache.idianyou.cn/dianyou/data/circle/img/20180201/ff808081614d163a01614d2bb60913a1.png",
                         @"http://alcache.idianyou.cn/dianyou/data/circle/img/20180316/ff808081622ca9fe01622cc998ab1321.png",
                         @"http://alcache.idianyou.cn/dianyou/data/circle/img/20180316/ff808081622ca9fe01622cba62160395.png",
                         @"http://alcache.idianyou.cn/dianyou/data/circle/img/20180316/ff808081622ca9fe01622cc97e7212ea.png",
                         @"http://alcache.idianyou.cn/dianyou/data/circle/img/20180201/ff808081614d163a01614d2f121f170f.png",
                         @"http://alcache.idianyou.cn/dianyou/data/circle/img/20180316/ff808081622ca9fe01622cc4de690dd2.png",
                         @"http://alcache.idianyou.cn/dianyou/data/circle/img/20180201/ff808081614d163a01614d414978284a.png"];
    NSArray *singArr = @[@"我是张三",@"我是王大拿",@"我是王小贱",@"逗我是你玩",@"我是绿豆蛙",@"我是大嘴巴",@"我是小蛮腰",@"我是抠脚汉",@"我是后来",@"我是天亮以后"];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (NSInteger i = 0; i < 50; i ++) {
            //随机一个值
            NSInteger randomIndex = arc4random() % 10;
            NSString *textContent;
            NSString *verifyType;
            if (i % 2 == 0) {
                textContent = @"sahdhfaks 的创建按说积分按说的风格水倒入发额发sahdhfaks 的创建按说积分按说的风格水倒入发额发sahdhfaks 的创建按说积分按说的风格水倒入发额发sahdhfaks 的创建按说积分按说的风格水倒入发额发sahdhfaks 的创建按说积分按说的风格水倒入发额发sahdhfaks 的创建按说积分按说的风格水倒入发额发sahdhfaks 的创建按说积分按说的风格水倒入发额发sahdhfaks 的创建按说积分按说的风格水倒入发额发sahdhfaks 的创建按说积分按说的风格水倒入发额发sahdhfaks 的创建按说积分按说的风格水倒入发额发sahdhfaks 的创建按说积分按说的风格水倒入发额发sahdhfaks 的创建按说积分按说的风格水倒入发额发sahdhfaks 的创建按说积分按说的风格水倒入发额发sahdhfaks 的创建按说积分按说的风格水倒入发额发sahdhfaks 的创建按说积分按说的风格水倒入发额发sahdhfaks 的创建按说积分按说的风格水倒入发额发sahdhfaks 的创建按说积分按说的风格水倒入发额发sahdhfaks 的创建按说积分按说的风格水倒入发额发sahdhfaks 的创建按说积分按说的风格水倒入发额发sahdhfaks 的创建按说积分按说的风格水倒入发额发sahdhfaks 的创建按说积分按说的风格水倒入发额发sahdhfaks 的创建按说积分按说的风格水倒入发额发sahdhfaks 的创建按说积分按说的风格水倒入发额发sahdhfaks 的创建按说积分按说的风格水倒入发额发sahdhfaks 的创建按说积分按说的风格水倒入发额发sahdhfaks 的创建按说积分按说的风格水倒入发额发sahdhfaks 的创建按说积分按说的风格水倒入发额发sahdhfaks 的创建按说积分按说的风格水倒入发额发sahdhfaks 的创建按说积分按说的风格水倒入发额发sahdhfaks 的创建按说积分按说的风格水倒入发额发sahdhfaks 的创建按说积分按说的风格水倒入发额发sahdhfaks 的创建按说积分按说的风格水倒入发额发sahdhfaks 的创建按说积分按说的风格水倒入发额发sahdhfaks 的创建按说积分按说的风格水倒入发额发sahdhfaks 的创建按说积分按说的风格水倒入发额发sahdhfaks 的创建按说积分按说的风格水倒入发额发sahdhfaks 的创建按说积分按说的风格水倒入发额发sahdhfaks 的创建按说积分按说的风格水倒入发额发sahdhfaks 的创建按说积分按说的风格水倒入发额发";
                verifyType = @"0";
            }else{
                textContent = @"萨合 阿设法啊思维方式 安慰发网上";
                verifyType = @"1";
            }
            
            NSDictionary *dataDic = @{@"iconUrlStr":iconArr[randomIndex],@"userName":nameArr[randomIndex],@"sign":singArr[randomIndex],@"textContent":textContent,@"verifyType":verifyType};
            DataModel *dataModel = [DataModel modelWithDictionary:dataDic];
            ItemLayout *layout = [[ItemLayout alloc] init];
            layout.dataModel = dataModel;
            [self.dataArr addObject:layout];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    });
    
}
- (void)reloadView{
    [self.tableView reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArr.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    ItemLayout *model = (ItemLayout *)[self.dataArr objectAtIndex:indexPath.row];
    return model.cellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    ItemLayout *model = (ItemLayout *)[self.dataArr objectAtIndex:indexPath.row];
    ProfileView *profile = (ProfileView *)[cell viewWithTag:50];
    if (!profile) {
        profile = [[ProfileView alloc] init];
        profile.backgroundColor = [UIColor whiteColor];
        profile.tag = 50;
        [cell addSubview:profile];
    }
    if (model) {
        [profile.avatarView setImageWithURL:[NSURL URLWithString:model.dataModel.iconUrlStr] placeholder:nil options:kNilOptions manager:[YYDemoHelper avatarImageManager] progress:nil transform:nil completion:nil];
        profile.nameLabel.textLayout = model.nameTextLayout;
        profile.sourceLabel.textLayout = model.signLayout;
        profile.height = model.profileHeight;
        profile.top = kTopMargin;
    }
    YYLabel *label = (YYLabel *)[cell viewWithTag:100];
    if (!label) {
        YYLabel *label = [[YYLabel alloc] init];
//        label.displaysAsynchronously = YES;//开启异步渲染
//        label.ignoreCommonProperties = YES;
//        label.fadeOnAsynchronouslyDisplay = NO;
        label.fadeOnHighlight = NO;
        label.layer.borderColor = [UIColor brownColor].CGColor;
        label.layer.cornerRadius = 5.0;
        label.layer.borderWidth = 1;
        label.tag  = 100;
        [cell addSubview:label];
    }
    if (model) {
        label.frame = model.texFrame;
        label.textLayout = model.textLayout;

    }
    return cell;
}

@end

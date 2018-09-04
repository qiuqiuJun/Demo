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
@interface TestYYkitVC ()
@property (strong, nonatomic) NSMutableArray *dataArr;
@end

@implementation TestYYkitVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
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
                textContent = @"\n\
                消愁 - 毛不易\n\
                作词：毛不易\n\
                作曲：毛不易\n\
                \n\
                当你走进这欢乐场\n\
                背上所有的梦与想\n\
                各色的脸上各色的妆\n\
                没人记得你的模样\n\
                三巡酒过你在角落\n\
                固执的唱着苦涩的歌\n\
                听他在喧嚣里被淹没\n\
                你拿起酒杯对自己说\n\
                一杯敬朝阳 一杯敬月光\n\
                唤醒我的向往 温柔了寒窗\n\
                于是可以不回头地逆风飞翔\n\
                不怕心头有雨 眼底有霜\n\
                一杯敬故乡 一杯敬远方\n\
                守着我的善良 催着我成长\n\
                所以南北的路从此不再漫长\n\
                灵魂不再无处安放\n\
                一杯敬明天 一杯敬过往\n\
                支撑我的身体 厚重了肩膀\n\
                虽然从不相信所谓山高水长\n\
                人生苦短何必念念不忘\n\
                一杯敬自由 一杯敬死亡\n\
                宽恕我的平凡 驱散了迷惘\n\
                好吧天亮之后总是潦草离场\n\
                清醒的人最荒唐\n\
                好吧天亮之后总是潦草离场\n\
                清醒的人最荒唐";
                verifyType = @"0";
            }else{
                textContent = @"\n\
                盗将行 - 冷泽诗\n\
                作词:张振泽\n\
                作曲:麦曲\n\
                \n\
                看那轻衣摇摆， 雨衣朦胧雾霭\n\
                我劫过九重城关我坐下马睡正酣\n\
                踏过三江六岸， 把光做成船帆\n\
                那露水淋透衣衫我与那虎豹为餐\n\
                盗入南京王府， 用这性命去赌\n\
                我未曾把这墓贪取出帝王之簪\n\
                冷风夜宿多年， 蜀中大雨连绵\n\
                你的笑就像恶犬它波动我的心弦\n\
                我们月下谈话， 对你产生牵挂\n\
                拎这条大鱼的眩问先生它值几钱\n\
                巷里去吃汤面，满天雪花飘散\n\
                取出腰间的弹珠逃到这世外成都\n\
                夙愿像条飞箭，故乡远在天边\n\
                不知何人拨弄琴弦我却不敢向前\n\
                将军辞官之后，无人在去知晓\n\
                只留了这个故事去让这后人迷痴\n\
                一声醒目拍下，人从梦中惊吓\n\
                这众人起身就散说书人泪流满面\n\
                枇杷树的枝头，小鸟逐个低头\n\
                我还是对你想念树上的那个玉簪\n";
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
        label.displaysAsynchronously = YES;//开启异步渲染
        label.ignoreCommonProperties = YES;
        label.layer.borderColor = [UIColor brownColor].CGColor;
        label.layer.cornerRadius = 5.0;
        label.layer.borderWidth = 1;
        label.tag  = 100;
        [cell.contentView addSubview:label];
    }
    if (model) {
        label.frame = model.texFrame;
        label.textLayout = model.textLayout;
    }
    return cell;
}

@end

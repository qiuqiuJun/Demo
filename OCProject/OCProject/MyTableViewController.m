//
//  MyTableViewController.m
//  OCProject
//
//  Created by wqq on 2018/9/1.
//  Copyright © 2018年 wqq. All rights reserved.
//

#import "MyTableViewController.h"

@interface MyTableViewController ()
@property (strong ,nonatomic) NSMutableArray *itemArr;
@end

@implementation MyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Demo列表";
    self.tableView.backgroundColor = UIColor.whiteColor;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma -mark -lazy
- (NSMutableArray *)itemArr{
    if (nil ==  _itemArr) {
        _itemArr = [[NSMutableArray alloc] initWithObjects:@{@"title":@"工厂模式",@"className":@"FactoryVC"},@{@"title":@"对const的理解",@"className":@"TestConstVC"}, @{@"title":@"wk和js交互",@"className":@"WkJsVC"},
                    @{@"title":@"程序内修改appIcon+Method Swizzling使用",@"className":@"ChangeAppIconVC"},nil];
    }
    return _itemArr;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.itemArr.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    NSDictionary *dic = (NSDictionary *)[self.itemArr objectAtIndex:indexPath.row];
    NSString *title = dic[@"title"];
    cell.textLabel.text = title;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSDictionary *dic = (NSDictionary *)[self.itemArr objectAtIndex:indexPath.row];
    NSString *className = dic[@"className"];
    UIViewController *con = [(UIViewController *)[NSClassFromString(className) alloc] init];
    [self.navigationController pushViewController:con animated:YES];
}

@end

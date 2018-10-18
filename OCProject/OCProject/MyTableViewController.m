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
    
    //排序
//    NSMutableArray *arr = [NSMutableArray arrayWithObjects:@"5",@"56",@"3",@"45",@"93", nil];
//    [self fdashdhfs:arr];
//    NSLog(@"arr-final==%@",arr);
    //测试masksToBundles
}

-(void)maopaoSort:(NSMutableArray *)array{
    for (NSInteger i = 0; i < array.count; i++) {
        for (NSInteger j = 0; j<array.count-i-1; j++) {
            if ([array[j] integerValue] < [array[j+1] integerValue]) {
                NSInteger temp = [array[j] integerValue];
                array[j] = @([array[j+1] integerValue]);
                array[j+1] = @(temp);
            }
        }
        NSLog(@"array==%@",array.description);
    }
}

- (void)dfsahjhd:(NSMutableArray *)arr{
    for (NSInteger i = 0; i < arr.count-1; i ++) {
        for (NSInteger j = 0; j < arr.count - i - 1; j++) {
            NSInteger temp = [arr[j] integerValue];
            if (temp < [arr[j + 1] integerValue]) {
                arr[j] = arr[j + 1];
                arr[j + 1] = @(temp);
            }
        }
    }
}
- (void)fdashdhfs:(NSMutableArray *)arr{
    for (NSInteger i = 0; i < arr.count; i ++) {
        for (NSInteger j = i + 1; j < arr.count; j ++) {
            NSInteger temp = [arr[i] integerValue];
            if (temp < [arr[j] integerValue]) {
                arr[i] = arr[j];
                arr[j] = @(temp);
            }
        }
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma -mark -lazy
- (NSMutableArray *)itemArr{//
    if (nil ==  _itemArr) {
        _itemArr = [[NSMutableArray alloc] initWithObjects:
  @{@"title":@"工厂模式",@"className":@"FactoryVC"},
  @{@"title":@"对const的理解",@"className":@"TestConstVC",@"storyboardId":@"TestConstVC"},
  @{@"title":@"wk和js交互",@"className":@"WkJsVC"},
  @{@"title":@"程序内修改appIcon+Method Swizzling使用",@"className":@"ChangeAppIconVC"},
  @{@"title":@"深浅copy",@"className":@"CopyAndMutableCopyVC",@"storyboardId":@"CopyAndMutableCopyVC"},
  @{@"title":@"YYlabel",@"className":@"TestYYkitVC"},
  @{@"title":@"YYImage",@"className":@"YYImageTestVC"},
  @{@"title":@"GCD",@"className":@"GCDController",@"storyboardId":@"GCDController"},
  @{@"title":@"QR",@"className":@"QRViewController"},
  @{@"title":@"kvc测试",@"className":@"TestKVC"},
  @{@"title":@"YYModel学习",@"className":@"StudyYYModelVC"},nil];//
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
    UIViewController *con;
    if ([[dic allKeys] containsObject:@"storyboardId"]) {
        con = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:dic[@"storyboardId"]];
    }else{
        con= [(UIViewController *)[NSClassFromString(className) alloc] init];
    }
    [self.navigationController pushViewController:con animated:YES];
}

@end

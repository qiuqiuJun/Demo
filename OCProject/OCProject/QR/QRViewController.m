//
//  QRViewController.m
//  OCProject
//
//  Created by DOUBLEQ on 2018/9/6.
//  Copyright © 2018年 wqq. All rights reserved.
//

#import "QRViewController.h"
#import "Masonry.h"
#import "OCProject-Swift.h"
@interface QRViewController ()
@property (strong ,nonatomic) NSMutableArray *itemArr;

@end

@implementation QRViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    __weak typeof(self) weakSelf = self;
//    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.top.bottom.equalTo(weakSelf.view);
//    }];
}
#pragma -mark -lazy
- (NSMutableArray *)itemArr{
    if (nil ==  _itemArr) {
        _itemArr = [[NSMutableArray alloc] initWithObjects:@{@"title":@"二维码扫描",@"className":@"ScanQRVC",@"storyboardId":@"ScanQRVC"},@{@"title":@"二维码生成",@"className":@"MakeQRVC",@"storyboardId":@"MakeQRVC"},nil];
    }
    return _itemArr;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
    if ([className isEqualToString:@"MakeQRVC"]) {
        con = [[GeneratorController alloc] init];
    }else{
        con = [[RecognizerController alloc] init];
    }
//    if ([[dic allKeys] containsObject:@"storyboardId"]) {
//        con = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:dic[@"storyboardId"]];
//    }else{
//        con= [(UIViewController *)[NSClassFromString(className) alloc] init];
//    }
    [self.navigationController pushViewController:con animated:YES];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

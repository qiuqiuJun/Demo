//
//  YYImageTestVC.m
//  OCProject
//
//  Created by DOUBLEQ on 2018/9/4.
//  Copyright © 2018年 wqq. All rights reserved.
//

#import "YYImageTestVC.h"
#import "YYKit.h"
@interface YYImageTestVC ()
//@property (strong, nonatomic) NSMutableArray *dataArr;
@end

@implementation YYImageTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"niconiconi"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"wall-e"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"pia"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    NSInteger randIndex = arc4random() % 3;
    switch (randIndex) {
        case 0:
        {
            cell = [tableView dequeueReusableCellWithIdentifier:@"niconiconi" forIndexPath:indexPath];
            YYAnimatedImageView *imageView = (YYAnimatedImageView *)[cell viewWithTag:100];
            if (!imageView) {
                YYImage *image = [YYImage imageNamed:@"niconiconi"];
                imageView = [[YYAnimatedImageView alloc] initWithImage:image];
                imageView.centerX = self.view.width / 2;
                imageView.centerY = cell.height / 2;
                imageView.tag = 100;
                [cell addSubview:imageView];
            }
            
        }
            break;
        case 1:
        {
            cell = [tableView dequeueReusableCellWithIdentifier:@"wall-e" forIndexPath:indexPath];
            YYAnimatedImageView *imageView = (YYAnimatedImageView *)[cell viewWithTag:100];
            if (!imageView) {
                YYImage *image = [YYImage imageNamed:@"wall-e"];
                imageView = [[YYAnimatedImageView alloc] initWithImage:image];
                imageView.centerX = self.view.width / 2;
                imageView.centerY = cell.height / 2;
                imageView.tag = 100;
                [cell addSubview:imageView];
            }
        }
            break;
        case 2:
        {
            cell = [tableView dequeueReusableCellWithIdentifier:@"pia" forIndexPath:indexPath];
            YYAnimatedImageView *imageView = (YYAnimatedImageView *)[cell viewWithTag:100];
            if (!imageView) {
                YYImage *image = [YYImage imageNamed:@"pia"];
                imageView = [[YYAnimatedImageView alloc] initWithImage:image];
                imageView.centerX = self.view.width / 2;
                imageView.centerY = cell.height / 2;
                imageView.tag = 100;
                [cell addSubview:imageView];
            }
        }
            break;
            
        default:
            break;
    }
    
    return cell;
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

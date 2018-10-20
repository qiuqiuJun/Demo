//
//  DBHelper.m
//  OCProject
//
//  Created by wqq on 2018/10/17.
//  Copyright © 2018 wqq. All rights reserved.
//

#import "DBHelper.h"
static NSString *const kUserTabName = @"userInfoTab";

@interface DBHelper()
@property (nonatomic,strong) FMDatabaseQueue *queue;
@end

@implementation DBHelper

static DBHelper *instance = nil;
static dispatch_once_t pred = 0;

+ (DBHelper *)instance{
    dispatch_once(&pred, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (FMDatabaseQueue *)queue{
    if (nil == _queue) {
        _queue = [FMDatabaseQueue databaseQueueWithPath:[self dbPath]];
    }
    return _queue;
}
- (NSString *)dbPath{
    NSArray *filePath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDir = filePath[0];
    return [documentDir stringByAppendingPathComponent:@"wangquanqi.db"];
    
}
- (void)inesertName:(NSString *)name age:(NSString *)age address:(NSString *)address{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"分线程操作====");
        sleep(10);
        [self.queue inDatabase:^(FMDatabase * _Nonnull db) {
            if (![db tableExists:kUserTabName]) {
                NSString *sql = [NSString stringWithFormat:@"CREATE TABLE '%@' (id INTEGER PRIMARY KEY  NOT NULL ,name TEXT, age TEXT,address TEXT)",kUserTabName];
                BOOL creatResult = [self creatTab:sql db:db];
                if (creatResult) {
                    NSLog(@"建表成功==");
                }else{
                    NSLog(@"建表失败==");
                }
            }
            NSString *insertSql = [NSString stringWithFormat:@"INSERT INTO %@ (name,age,address) VALUES (?, ?, ?)",kUserTabName];
            BOOL insertResult =  [db executeUpdate:insertSql,name,age,address];
            if (insertResult) {
                NSLog(@"插入成功==");
            }else{
                NSLog(@"插入失败==");
            }
        }];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"回到主线程===");
        });
    });

}
- (BOOL)creatTab:(NSString *)sql db:(FMDatabase *)db{
    BOOL result = [db executeUpdate:sql];
    return result;
}

@end

//
//  DBHelper.h
//  OCProject
//
//  Created by wqq on 2018/10/17.
//  Copyright © 2018 wqq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"
@interface DBHelper : NSObject
//+ (FMDatabaseQueue *)dbQueue;
+ (DBHelper *)instance;
- (void)inesertName:(NSString *)name age:(NSString *)age address:(NSString *)address;
@end

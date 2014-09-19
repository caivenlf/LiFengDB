//
//  QueueInstance.h
//  DB
//
//  Created by Vincent on 14-9-19.
//  Copyright (c) 2014年 Vicent. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"
#import "DBConstant.h"

@interface QueueInstance : NSObject

+ (instancetype)shareInstance;
/*!
    @func 切换数据库
 */
+ (void)refreshDatabase:(NSString *)databaseName;

+ (NSString *)databasePath:(NSString *)databaseName;
/*!
    @func 对数据库进行的操作放入block中
 */
- (void)inDatabase:(void(^)(FMDatabase *db))block;
@end

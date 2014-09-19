//
//  DBOperation.h
//  DB
//
//  Created by Vincent on 14-9-19.
//  Copyright (c) 2014年 Vicent. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QueueInstance.h"
#import "SportModel.h"
@interface DBOperation : NSObject

+ (instancetype)shareInstance;
/*!
    @func 切换数据库（一般在切换用户，登录的时候切换数据库，如果用户不存在，创建数据库并初始化表，否则只是切换数据库Queue）
    @param databaseName:切换到数据库的名字
    @param init(BOOL):是否需要初始化数据库的表
 */
+ (void)refreshDatabase:(NSString *)databaseName InitTable:(BOOL)init;

#pragma mark - 表的创建
/*!
    @func 创建数据库的表结构
    @param db   操作的数据库
 */
- (void)createTables:(FMDatabase *)db;
/*!
    @func  删除当前数据库的表
 */

#pragma mark - 表删除数据
- (void)deleteAllTableData:(NSString *)tableName;
/*!
    @func 根据条件删除表数据
    @param date 传入的时间
    @param days 距离传入时间的前N天
 */
- (void)deleteTable:(NSString *)tableName date:(NSDate *)date beforDays:(NSInteger)days;

#pragma mark - 表添加数据
/*!
    @func 添加表数据
 */
- (void)addSport:(SportModel*)sport;

#pragma mark - 更新表数据
/*!
    @func 更新表数据
 */
- (void)updateSubmitSportData:(NSArray *)sports;

#pragma mark - 查询表数据
/*!
    @func 查询未提交的表数据
 */
- (NSArray *)getNoSubmitSportData;


@end

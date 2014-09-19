//
//  DBOperation.m
//  DB
//
//  Created by Vincent on 14-9-19.
//  Copyright (c) 2014年 Vicent. All rights reserved.
//

#import "DBOperation.h"
#define Queue   [QueueInstance shareInstance]
@interface DBOperation(){
    
}
@end
@implementation DBOperation

+ (instancetype)shareInstance{
    static DBOperation *this;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        this = [[DBOperation alloc] init];
    });
    return this;
}

- (id)init{
    self = [super init];
    if (self) {
        [self createDatabase:nil];
    }
    return self;
}

- (void)createDatabase:(NSString *)databaseName{
    dispatch_queue_t q = dispatch_queue_create(Queue_createDatabase, NULL);
    dispatch_async(q, ^{
        
        [[QueueInstance shareInstance] inDatabase:^(FMDatabase *db) {
            //开始创建数据表
            [self createTables:db];
        }];
    });
}

+ (void)refreshDatabase:(NSString *)databaseName InitTable:(BOOL)init{
    [QueueInstance refreshDatabase:databaseName];
    if (init) {
        [[self shareInstance] createDatabase:databaseName];
    }
}

- (void)createTables:(FMDatabase *)db{
    // 运动表
    NSString *createSportSql = [NSString stringWithFormat:@"create table %@ (%@ INTEGER PRIMARY KEY autoincrement, %@ varchar(30), %@ varchar(30), %@ INTEGER, %@ INTEGER, %@ INTEGER, %@ INTEGER, %@ varchar(30), %@ INTEGER)", TABLE_SPORT, ID, BEGIN_TIME, END_TIME, STEP_COUNT, POINT_COUNT, TOTAL_TIME, SPORT_TYPE, HAPPEN_DATE, IS_SUBMIT];
    [db executeUpdate:createSportSql];
    
    // 跑步表
    NSString *createRunSql = [NSString stringWithFormat:@"create table %@ (%@ INTEGER PRIMARY KEY autoincrement, %@ varchar(30), %@ varchar(30), %@ double, %@ INTEGER, %@ INTEGER, %@ INTEGER, %@ INTEGER, %@ INTEGER, %@ varchar(30), %@ INTEGER)", TABLE_RUN, ID, BEGIN_TIME, END_TIME, DISTANCE, TOTAL_TIME, POINT_COUNT, KM_TIME, LEVEL, RUN_TYPE, HAPPEN_DATE, IS_SUBMIT];
    [db executeUpdate:createRunSql];
}

- (void)deleteAllTableData:(NSString *)tableName{
    dispatch_queue_t q = dispatch_queue_create(Queue_deleteTableDatas, nil);
    dispatch_async(q, ^{
        
        [[QueueInstance shareInstance] inDatabase:^(FMDatabase *db) {
            NSString *deleteSql = [NSString stringWithFormat:@"delete from %@", tableName];
            [db executeUpdate:deleteSql];
        }];
    });
}

- (void)deleteTable:(NSString *)tableName date:(NSDate *)date beforDays:(NSInteger)days{
//    NSString *deleteSql = [NSString stringWithFormat:@"delete from %@ where datetime(happen_date) between datetime('%@ 00:00:00') and datetime('%@ 23:59:59') and is_submit = 1", tableName, [[date getSpecifyDate:days andType:BREAK_DAY] formatDateString:kDateFormat], [date formatDateString:kDateFormat]];
}

- (void)addSport:(SportModel*)sport{
    dispatch_queue_t q = dispatch_queue_create(Queue_addTableDatas, nil);
    dispatch_async(q, ^{
        [[QueueInstance shareInstance] inDatabase:^(FMDatabase *db) {
            [db executeUpdate:@"insert into table_sport(begin_time, end_time, step_count, point_count, total_time, sport_type, happen_date, is_submit) values (?, ?, ?, ?, ?, ?, ?, ?, ?)", sport.beginTime, sport.endTime, @(sport.stepCount), @(sport.pointCount), @(sport.totalTime),@(sport.sportType), sport.happenDate, @(sport.isSubmit)];
        }];
    });
}

- (void)updateSubmitSportData:(NSArray *)sports{
    dispatch_queue_t q = dispatch_queue_create(Queue_updateTableDatas, nil);
    dispatch_async(q, ^{
        [[QueueInstance shareInstance] inDatabase:^(FMDatabase *db) {
            for (SportModel *sport in sports) {
                [db executeUpdate:@"update table_sport set is_submit = 1 where sport_type = ?", @(sport.sportType)];
            }
        }];
    });
}

- (NSArray *)getNoSubmitSportData{
    dispatch_queue_t q = dispatch_queue_create(Queue_selectTableDatas, nil);
    __block NSMutableArray *results = [[NSMutableArray alloc] init];
    dispatch_async(q, ^{
        [[QueueInstance shareInstance] inDatabase:^(FMDatabase *db) {
            FMResultSet *resultSet = [db executeQuery:@"select * from table_sport where is_submit = 0"];
            while ([resultSet next]) {
                [results addObject:[SportModel parseDb2Object:resultSet]];
            }
        }];
    });
    return results;
}
@end

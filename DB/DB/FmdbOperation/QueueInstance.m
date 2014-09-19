//
//  QueueInstance.m
//  DB
//
//  Created by Vincent on 14-9-19.
//  Copyright (c) 2014年 Vicent. All rights reserved.
//

#import "QueueInstance.h"
#define DATA_BASE_DEFAULT_NAME @"default_database"


@interface QueueInstance(){
    FMDatabaseQueue *queue;
}
@end
@implementation QueueInstance

+ (instancetype)shareInstance{
    static QueueInstance *this = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        this = [[QueueInstance alloc] init];
    });
    return this;
}

- (id)init{
    self = [super init];
    if (self) {
        queue = [FMDatabaseQueue databaseQueueWithPath:[self.class databasePath:nil]];
    }
    return self;
}

- (void)inDatabase:(void(^)(FMDatabase *db))block{
    [queue inDatabase:^(FMDatabase *db) {
        block(db);
    }];
}

/*!
    @func 返回数据库名字，default:DATA_BASE_DEFAULT_NAME
 */
+ (NSString *)databasePath:(NSString *)databaseName{
    NSString *currentDatabaseName = (databaseName==nil?DATA_BASE_DEFAULT_NAME:databaseName);
    return [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/%@.db", currentDatabaseName]];
}

+ (void)refreshDatabase:(NSString *)databaseName{
    [[self shareInstance] changeDatabaseQueue:databaseName];
}

- (void)changeDatabaseQueue:(NSString *)databaseName{
    NSString *databasePath = [self.class databasePath:databaseName];
    queue = [FMDatabaseQueue databaseQueueWithPath:databasePath];
}
@end

//
//  SportModel.h
//  DB
//
//  Created by Vincent on 14-9-19.
//  Copyright (c) 2014年 Vicent. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"
#import "DBConstant.h"
@interface SportModel : NSObject

@property (nonatomic,assign) NSString *beginTime;
@property (nonatomic,assign) NSString *endTime;
@property (nonatomic,assign) NSInteger stepCount;
@property (nonatomic,assign) NSInteger pointCount;
@property (nonatomic,assign) NSInteger totalTime;
@property (nonatomic,assign) NSInteger sportType;
@property (nonatomic,assign) NSString *happenDate;
@property (nonatomic,assign) NSInteger isSubmit;

/*!
    @func  数据库解析
    @param resultSet 数据库set
 */
+ (SportModel *)parseDb2Object:(FMResultSet *)resultSet;
@end

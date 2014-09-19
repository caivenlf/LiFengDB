//
//  SportModel.m
//  DB
//
//  Created by Vincent on 14-9-19.
//  Copyright (c) 2014年 Vicent. All rights reserved.
//

#import "SportModel.h"

@implementation SportModel

+ (SportModel *)parseDb2Object:(FMResultSet *)resultSet{
    SportModel *sport = [[SportModel alloc] init];

    sport.beginTime = [resultSet stringForColumn:BEGIN_TIME];
    sport.endTime = [resultSet stringForColumn:END_TIME];
    sport.pointCount = [resultSet intForColumn:POINT_COUNT];
    sport.stepCount = [resultSet intForColumn:STEP_COUNT];
    sport.totalTime = [resultSet intForColumn:TOTAL_TIME];
    sport.sportType = [resultSet intForColumn:SPORT_TYPE];
    sport.happenDate = [resultSet stringForColumn:HAPPEN_DATE];
    sport.isSubmit = [resultSet intForColumn:IS_SUBMIT];
    
    return sport;
}

@end

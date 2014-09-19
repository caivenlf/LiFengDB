//
//  DBConstant.h
//  DB
//
//  Created by Vincent on 14-9-19.
//  Copyright (c) 2014年 Vicent. All rights reserved.
//

#ifndef DB_DBConstant_h
#define DB_DBConstant_h

#define     Queue_createDatabase    "createDatabaseQueue"
#define     Queue_deleteTableDatas  "deleteTableDataQueue"
#define     Queue_addTableDatas     "addTableDatasQueue"
#define     Queue_updateTableDatas  "updateTableDataQueue"
#define     Queue_selectTableDatas  "selectTbaleDataQueue"

/********************************   Common   **********************************/
// 自增id
#define ID @"id"
// 开始时间
#define BEGIN_TIME @"begin_time"
// 结束时间
#define END_TIME @"end_time"
// 发生日期
#define HAPPEN_DATE @"happen_date"
// 总时间
#define TOTAL_TIME @"total_time"
// 是否提交,0未提交，1已提交
#define IS_SUBMIT @"is_submit"

/********************************   Table   **********************************/
// 运动表属性
#define TABLE_SPORT @"table_sport"
// 步数
#define STEP_COUNT @"step_count"
// 本次运动获得的点数
#define POINT_COUNT @"point_count"
// 运动类型
#define SPORT_TYPE  @"sport_type"

// 跑步表属性
#define TABLE_RUN @"table_run"
// 跑步距离
#define DISTANCE @"distance"
// 训练强度
#define LEVEL @"level"
// 跑步类型
#define RUN_TYPE @"run_type"
// 每公里用时
#define KM_TIME @"km_time"
//每天总用时
#define RUN_TIME @"total_time"

#endif

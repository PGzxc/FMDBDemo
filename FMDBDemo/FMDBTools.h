//
//  FMDBTools.h
//  FMDBDemo
//
//  Created by zxc on 2022/4/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class Shop;

@interface FMDBTools : NSObject
//创建表格
+(void)createTable;
//添加数据
+(void)insertShop:(Shop *)shop;
//查询数据
+(NSMutableArray *)selectTableAll;
//更新数据
+(void)updateTable;
//删除表格数据
+(void)deleteTable;

@end

NS_ASSUME_NONNULL_END

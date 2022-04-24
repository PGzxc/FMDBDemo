//
//  FMDBTools.m
//  FMDBDemo
//
//  Created by zxc on 2022/4/23.
//

#import "FMDBTools.h"
#import "FMDB.h"
#import "Shop.h"


@implementation FMDBTools

static FMDatabase *_db;

+(void)initialize{
    // 1.打开数据库
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"shops.sqlite"];
    _db = [FMDatabase databaseWithPath:path];
    [_db open];
}
//创建表格
+(void)createTable
{
    // 创表
    BOOL success = [_db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_shop (id integer PRIMARY KEY, name text NOT NULL, price real);"];
    if (success) {
        NSLog(@"Table创建成功");
    }else{
        NSLog(@"error = %@", [_db lastErrorMessage]);
    }
    
}
//添加数据
+(void)insertShop:(Shop *)shop
{
    BOOL success = [_db executeUpdateWithFormat:@"INSERT INTO t_shop(name, price) VALUES (%@, %f);", shop.name, shop.price];
    if (success) {
        NSLog(@"添加数成功");
    }else{
        NSLog(@"error = %@", [_db lastErrorMessage]);
    }
}
//查询数据
+(NSMutableArray *)selectTableAll
{
        //得到结果集
        FMResultSet *set = [_db executeQuery:@"SELECT * FROM t_shop;"];
         //集合
        NSMutableArray *array = [NSMutableArray array];
        // 不断往下取数据
        while (set.next) {
            // 获得当前所指向的数据
            Shop *shop = [[Shop alloc] init];
            shop.name = [set stringForColumn:@"name"];
            shop.price = [set doubleForColumn:@"price"];
            [array addObject:shop];
        }
        return array;
}
//更新数据
+(void)updateTable
{
    NSString *sql = [NSString stringWithFormat:@"update t_shop set price=%u;",arc4random()%5];
    BOOL success = [_db executeUpdate:sql];
    if (success) {
        NSLog(@"更新数据成功");
    }else{
        NSLog(@"error = %@", [_db lastErrorMessage]);
    }
}
//删除表格数据
+(void)deleteTable
{
    NSString *sql = [NSString stringWithFormat:@"delete from t_shop"];
    BOOL success = [_db executeUpdate:sql];
    if (success) {
        NSLog(@"删除表格成功");
    }else{
        NSLog(@"error = %@", [_db lastErrorMessage]);
    }
}
@end

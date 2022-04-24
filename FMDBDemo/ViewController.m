//
//  ViewController.m
//  FMDBDemo
//
//  Created by zxc on 2022/4/23.
//

#import "ViewController.h"
#import "Shop.h"
#import "FMDBTools.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
//创建表格
- (IBAction)createTableBtn
{
    [FMDBTools createTable];
}
//添加数据
- (IBAction)insertTableBtn
{
    Shop *shop=[[Shop alloc]init];
    shop.name=[NSString stringWithFormat:@"白菜-%d",arc4random() % 200];
    shop.price=(arc4random() % 10);
        
    [FMDBTools insertShop:shop];
    //执行查询
    [self selectTableBtn];
}
//查询数据
- (IBAction)selectTableBtn
{
    NSMutableArray *array= [FMDBTools selectTableAll];
    for (Shop *shop in array) {
       NSLog(@"shop:name=%@,price=%f",shop.name,shop.price);
    }
}
//更新数据
- (IBAction)updateTableBtn
{
    NSLog(@"更新前数据：");
    [self selectTableBtn];
    [FMDBTools updateTable];
    NSLog(@"更新后数据：");
    [self selectTableBtn];
}
//删除表格
- (IBAction)deleteTableBtn
{
    NSLog(@"删除前数据：");
    [self selectTableBtn];
    [FMDBTools deleteTable];
    NSLog(@"删除后数据：");
    [self selectTableBtn];
}

@end

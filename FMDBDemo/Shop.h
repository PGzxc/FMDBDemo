//
//  Shop.h
//  FMDBDemo
//
//  Created by zxc on 2022/4/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Shop : NSObject

@property (nonatomic, copy) NSString *name; //商品名称
@property (nonatomic, assign) double  price; //商品价格

@end

NS_ASSUME_NONNULL_END

//
//  ZZMakeDecide.h
//  ZZKit
//
//  Created by 袁亮 on 16/5/16.
//  Copyright © 2016年 Migic_Z. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZZMakeDecide : NSObject


/**
 *  生成字符串方法
 *  @Introduce : 此方法多用于发布信息时使用，验证参数字典
 *  @exmple NSDictionary *param = @{
                                    @"username":@"yuanliang",
                                    @"password":@"123456",
                                    };
 *  验证此字典中username，password两个key中的value是否为空字符串，如果为空字符串则执行block回调方法
 *  @return 字符串方法
 */
+(ZZMakeDecide *) shareMake;

/**
 *  生成.h文件中的方法
 *
 *  @return .h文件中方法的字符串，从控制台中copy字符串即可
 */
-(NSString *) make_h_Method:(NSDictionary *)item;

/**
 *  生成.m文件中的方法
 *
 *  @return .m文件中方法的字符串，从控制台中copy字符串即可
 */
-(NSString *) make_m_method:(NSDictionary *)item;

@end

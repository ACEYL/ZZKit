//
//  ZZEncode.h
//  ZZKit
//
//  Created by 袁亮 on 16/5/12.
//  Copyright © 2016年 Migic_Z. All rights reserved.
//

/**
 *
 *      本类中的方法为常见加密方法
 */

#import <Foundation/Foundation.h>

@interface ZZEncode : NSObject

/**
 *
 *  @return MD5 16位加密 字符串
 */
+ (NSString *)fetchMD5_16Bit_Code:(NSString *)string;

/**
 *
 *  @return MD5 32位加密 字符串
 */
+ (NSString *)fetchMD5_32Bit_Code:(NSString *)string;

/**
 *
 *  @return sha1加密 字符串
 */
+ (NSString *)fetchSha1_Code:(NSString *)string;

/**
 *
 *  @return sha224加密 字符串
 */
+ (NSString *)fetchSha224_code:(NSString *)string;

/**
 *
 *  @return sha256加密 字符串
 */
+ (NSString *)fetchSha256_code:(NSString *)string;

/**
 *
 *  @return sha384加密 字符串
 */
+ (NSString *)fetchSha384_code:(NSString *)string;

/**
 *
 *  @return sha512加密 字符串
 */
+ (NSString *)fetchSha512_code:(NSString *)string;

/**
 *
 *  @return base64加密 字符串
 */
+ (NSString*)encodeBase64String:(NSString *)input;

/**
 *
 *  @return base64解密 字符串
 */
+ (NSString*)decodeBase64String:(NSString *)input;


@end

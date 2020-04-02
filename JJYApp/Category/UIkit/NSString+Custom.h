//
//  NSString+Custom.h
//  bike
//
//  Created by satgi on 12/10/14.
//  Copyright (c) 2014 yunzao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Custom)

+ (NSString *)currentRegion;
+ (NSString *)currentLanguage;
+ (NSString *)localizedURLString:(NSString *)URLString;
+ (NSString *)sha1:(NSString *)input;
+ (NSString *)md5:(NSString *)input;
+ (NSString *)nonNullStringForObject:(id )object;

- (void)call;
+ (NSString *)stringFromObject:(id)object;


+ (NSString *)getBinaryByhex:(NSString *)hex;

+ (CGSize)sizeForFont:(UIFont *)font
                 text:(NSString *)text
              maxSize:(CGSize)maxSize;

+ (CGSize)sizeForFont:(UIFont *)font
                 text:(NSString *)text;

- (NSAttributedString *)attributedString:(NSDictionary *)attributes
                                 forText:(NSString *)text;

- (BOOL)containsText:(NSString *)text;

- (NSAttributedString *)attributedString:(NSDictionary *)attributes
                                 forText:(NSString *)text
                           compareOption:(NSStringCompareOptions)compareOption;

+ (NSString *)stringDataWithJsonData:(id)data;

+ (NSString *)replaceStrWithRange:(NSRange)range
                           string:(NSString *)content
                       withString:(NSString *)replaceString;


+ (NSString *)addDotWithString:(NSString *)string;


//给数字添加两位后缀
+ (NSString *)countNumKeepTwo:(NSString *)num;

//给数字加，
+ (NSString *)countNumAndChangeformat:(NSString *)num;

+ (NSString*)getCurrentTimestamp;

+ (NSString *)UIImageToBase64Str:(UIImage *)image;

+ (NSString *)image2DataURL:(UIImage *)image;

+ (NSString *)timeStamp;

//MD5 32位 大写加密 小写x
+ (NSString *)getMd5_32Bit_String:(NSString *)srcString;

//字典转json格式字符串
+ (NSString*)dictionaryToJson:(NSDictionary *)dic;

//字符串转base64
- (NSString *)base64StringFromText;

//小数点格式
+ (NSString *)formatFloat:(float)f;
//手机号分服务商
- (BOOL)qr_isMobileNumberClassification;
- (BOOL)isChinese;//判断是否是纯汉字

- (BOOL)includeChinese;//判断是否含有汉字

+ (NSString *)randomStringWithLength:(NSInteger)len;


- (NSString *)encodingWitUrl;

@end

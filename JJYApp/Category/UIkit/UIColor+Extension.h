//
//  UIColor+Extension.h
//  FirstDemo
//
//  Created by ywf on 15/8/3.
//  Copyright (c) 2015年 fly. All rights reserved.
//

#import <UIKit/UIKit.h>

#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]


typedef NS_ENUM(NSInteger, WJLColorType) {
    WJLColorTypeRed   = 1,
    WJLColorTypeGreen = 2,
    WJLColorTypeBlue  = 3,
    WJLColorTypeAlpha = 4
};

@interface UIColor (Extension)

+(UIColor* )colorWithHexString:(NSString *)hexString;



- (CGColorSpaceModel) colorSpaceModel;
- (CGFloat) red;
- (CGFloat) green;
- (CGFloat) blue;
- (CGFloat) alpha;

- (UIColor *)reverseColor;
- (NSString *)printDetail;

- (UIColor *)up:(WJLColorType)type num:(NSInteger)num;
- (UIColor *)down:(WJLColorType)type num:(NSInteger)num;

@end

//
//  FontAndColorMacros.h
//  QXBApp
//
//  Created by ZQT on 2019/6/18.
//  Copyright © 2019年 TG. All rights reserved.

#ifndef UIUtility_h
#define UIUtility_h

//颜色宏
//主色
#define MainColor [UIColor colorWithHexString:@"#428EFE"]

#define HomeBackColor [UIColor colorWithHexString:@"#F7F7F7"]

#define GuideColor [UIColor colorWithHexString:@"#478BFF"]

#define WhiteColor [UIColor colorWithHexString:@"#FFFFFF"]

#define GuideGrayColor [UIColor colorWithHexString:@"#909090"]

#define BlueColor [UIColor colorWithHexString:@"#3387FF"]

#define BlackColor [UIColor colorWithHexString:@"#000000"]

#define Color_666 [UIColor colorWithHexString:@"#666666"]

#define Color_999 [UIColor colorWithHexString:@"#999999"]

#define Color_333 [UIColor colorWithHexString:@"#333333"]

//我的界面手写代码颜色配置
#define COLOR_TABBAR_UNSELECTED  [UIColor colorWithHexString:@"#94A3B2"]
#define Color_ORANGE [UIColor colorWithHexString:@"#F2592F"]
#define COLOR_LINE_CELL  RGB(239,239,239)
#define COLOR_WHITE  [UIColor colorWithHexString:@"#FFFFFF"]
#define COLOR_BACK  [UIColor colorWithHexString:@"#F4F4F4"]
#define COLOR_DRAGDOWN  [UIColor colorWithHexString:@"#409DFF"]
#define COLOR_DISABLED  [UIColor colorWithHexString:@"#DDDDDD"]


#define TextFieldDefaultColor RGB(148, 163, 178)
#define TextFieldPlaceHolderDefaultColor RGB(204, 204, 204)

//字体宏
//7
#define FONT_7 [UIFont systemFontOfSize:7.0f]
//9
#define FONT_9 [UIFont systemFontOfSize:9.0f]
//10
#define FONT_10 [UIFont systemFontOfSize:10.0f]
//11
#define FONT_11 [UIFont systemFontOfSize:11.0f]
//12
#define FONT_12 [UIFont systemFontOfSize:12.0f]
//13
#define FONT_13 [UIFont systemFontOfSize:13.0f]
//14
#define FONT_14 [UIFont systemFontOfSize:14.0f]
//15
#define FONT_15 [UIFont systemFontOfSize:15.0f]
//16
#define FONT_16 [UIFont systemFontOfSize:16.0f]
//17
#define FONT_17 [UIFont systemFontOfSize:17.0f]
//18 （注释18与字号对应）
#define FONT_18 [UIFont systemFontOfSize:18.0f]
//19
#define FONT_19 [UIFont systemFontOfSize:19.0f]
//20 （注释20与字号对应）
#define FONT_20 [UIFont systemFontOfSize:20.0f]
//22
#define FONT_22 [UIFont systemFontOfSize:22.0f]
//22
#define FONT_30 [UIFont systemFontOfSize:30.0f]
//36
#define FONT_36 [UIFont systemFontOfSize:36.0f]
//38
#define FONT_38 [UIFont systemFontOfSize:38.0f]

#define CustomFontWithSize(n,s) [UIFont fontWithName:(n) size:(s)]
#define FontNumberDinBoldWithSize(s) CustomFontWithSize(@"DIN Alternate", s)

#endif /* UIUtility_h */

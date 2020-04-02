//
//  CommonMacros.h
//  QXBApp
//
//  Created by ZQT on 2019/6/18.
//  Copyright © 2019年 TG. All rights reserved.

#import <Foundation/Foundation.h>


//当前用户对象(牵扯到其他文件)
#define USER_MODEL [AccountTool account]
#define WS(weakSelf) __weak __typeof(self) weakSelf = self;

//!!添加这两个宏后坐标传递cgfloat 可能 出问题，在"Masonry.h"
// 定义这个常量，就可以不用在开发过程中使用"mas_"前缀。
#define MAS_SHORTHAND
// 定义这个常量，就可以让Masonry帮我们自动把基础数据类型的数据，自动装箱为对象类型。
#define MAS_SHORTHAND_GLOBALS

// 系统版本号
#define SYSTEM_VERSION ([[[UIDevice currentDevice] systemVersion] floatValue])
// APP版本
#define BUNDLE_VERSION ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"])
// 提示
#define ALERT_SHOW(mag) UIAlertView * alertV = [[UIAlertView alloc]initWithTitle:@"提示信息" message:mag delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];\
[alertV show];
// 偏好设置设置
#define USER_DEFAULTS_SET(key, value) [[NSUserDefaults standardUserDefaults] setObject:value forKey:key];\
[[NSUserDefaults standardUserDefaults] synchronize]
// 偏好设置获取
#define USER_DEFAULTS_GET(key) [[NSUserDefaults standardUserDefaults] objectForKey:key]
// 偏好设置移除
#define USER_DEFAULTS_REMOVE(key) [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];\
[[NSUserDefaults standardUserDefaults] synchronize]
//  通知中心
#define QBNotificationCenter [NSNotificationCenter defaultCenter]
//手机设备
#define iPhone4 ([UIScreen mainScreen].bounds.size.height == 480)
#define iPhone5 ([UIScreen mainScreen].bounds.size.height == 568)
#define iPhone6 ([UIScreen mainScreen].bounds.size.height == 667)
#define iPhone6p ([UIScreen mainScreen].bounds.size.height == 736)
#define iPhoneX ([UIScreen mainScreen].bounds.size.height == 812 || [UIScreen mainScreen].bounds.size.height == 896)

//RGB的颜色转换
#define kUIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 \
blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:1.0]

#define kUIColorFromRGBA(r,g,b,a)     [UIColor colorWithRed:r / 255.0f green:g / 255.0f blue:b / 255.0f alpha:a]
//device screen size
#define KStatusHeight     [[UIApplication sharedApplication] statusBarFrame].size.height
#define Kinmo_iPhoneX (SCREEN_WIDTH == 375.f && SCREEN_HEIGHT == 812.f ? YES : NO)
#define kWRNavBarBottom (Kinmo_iPhoneX ? 88.f : 64.f)
//#define kWRNavBarBottom 0
#define kWTabbarHeight         (Kinmo_iPhoneX ? (49.f + 34.f) : 49.f)
#define SCREEN_BOUNDS  [UIScreen mainScreen].bounds
#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT  [UIScreen mainScreen].bounds.size.height

#define __SCREEN_SIZE               [UIScreen mainScreen].bounds.size
#define __SCALE_W                 (__SCREEN_SIZE.width / 375.0f)
#define __SCALE_H                 (__SCREEN_SIZE.width / 375.0f)
#define h375(__h__)                  ((__h__)*__SCALE_W)
#define w375(__w__)                  ((__w__)*__SCALE_H)

#define BORDER_WIDTH_1PX    ([[UIScreen mainScreen] scale] > 0.0 ? 1.0 / [[UIScreen mainScreen] scale] : 1.0)

#define NSStringFormat(format,...) [NSString stringWithFormat:format,##__VA_ARGS__]

//聊天缓存基本地址 (根据当前用户来创建缓存目录 , 每个登录用户创建单独资源文件夹,每个会话创建单独的文件夹 , 便于管理)
#define ChatCache_Path   [NSHomeDirectory() stringByAppendingString:[NSString stringWithFormat:@"/Library/Caches/ChatSource/%@",[AccountTool account].userId]]

#define hashEqual(str1,str2)  str1.hash == str2.hash  //hash码



//加载本地图片
#define LoadImage(imageName) [UIImage imageNamed:imageName]

#ifdef DEBUG
#define SLog(format, ...) printf("class: <%p %s:(%d) > method: %s \n%s\n", self, [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __PRETTY_FUNCTION__, [[NSString stringWithFormat:(format), ##__VA_ARGS__] UTF8String] )
#else
#define SLog(format, ...)
#endif



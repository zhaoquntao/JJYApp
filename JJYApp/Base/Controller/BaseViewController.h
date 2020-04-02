//
//  BaseViewController.h
//  QXBApp
//
//  Created by ZQT on 2019/6/18.
//  Copyright © 2019年 TG. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    //白色背景 有导航线条
    NavigationAppearanceTypeWhiteWithLine,
    //白色背景
    NavigationAppearanceTypeWhite,
    //灰色背景
    NavigationAppearanceTypeGray,
    //透明背景
    NavigationAppearanceTypeClear,
    
    
} NavigationAppearanceType;


@interface BaseViewController : UIViewController


+ (UIViewController *)presentingVC;
+ (void)presentVC:(UIViewController *)viewController;
+ (void)goToVC:(UIViewController *)viewController;
//修改导航栏样式
- (void)updateNavigationAppearanceWithType:(NavigationAppearanceType)type;


@end

NS_ASSUME_NONNULL_END

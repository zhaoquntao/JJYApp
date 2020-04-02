//
//  BaseViewController.m
//  QXBApp
//
//  Created by ZQT on 2019/6/18.
//  Copyright © 2019年 TG. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseNavViewController.h"
#import "BaseTabBarViewController.h"



@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = kUIColorFromRGB(0xEDEDED);
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self updateNavigationAppearanceWithType:NavigationAppearanceTypeWhiteWithLine];
}

#pragma mark - Private
- (void)updateNavigationAppearanceWithType:(NavigationAppearanceType)type {
    //状态栏颜色
    UIStatusBarStyle statusBarStyle;
    //导航栏标题颜色
    UIColor *navigationTitleColor;
    //导航栏背景图
    UIImage *navigationBarBackgroundImage;
    
    //导航栏按钮颜色
    UIColor *barButtonTextColor;
    
    UIImage *lineImage;
    
    switch (type) {
        case NavigationAppearanceTypeWhiteWithLine: {
            statusBarStyle = UIStatusBarStyleDefault;
            navigationTitleColor = BlackColor;
            navigationBarBackgroundImage = [self imageWithColor:[UIColor whiteColor]];
            barButtonTextColor = MainColor;
            lineImage = [UIImage imageWithColor:kUIColorFromRGBA(221, 221, 221, 1)];
        }
            break;
            
        case NavigationAppearanceTypeWhite: {
            statusBarStyle = UIStatusBarStyleDefault;
            navigationTitleColor = BlackColor;
            navigationBarBackgroundImage = [self imageWithColor:[UIColor whiteColor]];
            barButtonTextColor = MainColor;
            lineImage = [[UIImage alloc] init];
        }
            break;
        case NavigationAppearanceTypeGray: {
            statusBarStyle = UIStatusBarStyleLightContent;
            navigationTitleColor = [UIColor whiteColor];
            navigationBarBackgroundImage = [self imageWithColor:kUIColorFromRGB(0xEDEDED)];
            barButtonTextColor = MainColor;
            lineImage = [[UIImage alloc] init];
        }
            break;
        case NavigationAppearanceTypeClear: {
            statusBarStyle = UIStatusBarStyleLightContent;
            navigationTitleColor = [UIColor whiteColor];
            navigationBarBackgroundImage = [self imageWithColor:[UIColor clearColor]];
            barButtonTextColor = MainColor;
            lineImage = [[UIImage alloc] init];
        }
            break;
        default:
            break;
    }
    
    NSDictionary *textAttributes = @{
                                     NSForegroundColorAttributeName : navigationTitleColor,
                                     NSFontAttributeName            : [UIFont boldSystemFontOfSize:18.0f]
                                     };
    
    [self.navigationController.navigationBar setTitleTextAttributes:textAttributes];
    [self.navigationController.navigationBar setBackgroundImage:[navigationBarBackgroundImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                                  forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:lineImage];
    [[UIApplication sharedApplication] setStatusBarStyle:statusBarStyle];
    NSDictionary *barButtonTextAttributes = @{
                                              NSForegroundColorAttributeName : barButtonTextColor,
                                              NSFontAttributeName : [UIFont systemFontOfSize:16.0f]
                                              };
    [[UIBarButtonItem appearance] setTitleTextAttributes:barButtonTextAttributes
                                                forState:UIControlStateNormal];
    NSMutableArray *barButtonItems =
    [NSMutableArray arrayWithArray:self.navigationItem.leftBarButtonItems];
    [barButtonItems addObjectsFromArray:self.navigationItem.rightBarButtonItems];
    
    for (UIBarButtonItem *item in barButtonItems) {
        [item setTitleTextAttributes:barButtonTextAttributes
                            forState:UIControlStateNormal];
    }
    [self.navigationController.navigationBar setTintColor:barButtonTextColor];
    [[UINavigationBar appearance] setTintColor:barButtonTextColor];
}

- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = (CGRect){ CGPointZero, CGSizeMake(1.0, 1.0) };
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (void)presentVC:(UIViewController *)viewController {
    if (!viewController) {
        return;
    }
    UINavigationController *nav = [[BaseNavViewController alloc] initWithRootViewController:viewController];
    if (!viewController.navigationItem.leftBarButtonItem) {
        viewController.navigationItem.leftBarButtonItem =
        [[UIBarButtonItem alloc] initWithTitle:@"关闭"
                                         style:UIBarButtonItemStylePlain
                                        target:viewController
                                        action:@selector(dismissModalVC)];
    }
    [[self presentingVC] presentViewController:nav animated:YES completion:nil];
}

+ (void)goToVC:(UIViewController *)viewController {
    if (!viewController) {
        return;
    }
    UINavigationController *nav = [self presentingVC].navigationController;
    if (nav) {
        [nav pushViewController:viewController animated:NO];
    }
}

+ (UIViewController *)presentingVC {
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows) {
            if (tmpWin.windowLevel == UIWindowLevelNormal) {
                window = tmpWin;
                break;
            }
        }
    }
    UIViewController *result = window.rootViewController;
    while (result.presentedViewController) {
        result = result.presentedViewController;
    }
    
    if ([result isKindOfClass:[BaseTabBarViewController class]]) {
        result = [(BaseTabBarViewController *)result selectedViewController];
    }
    
    if ([result isKindOfClass:[UINavigationController class]]) {
        result = [(UINavigationController *)result topViewController];
    }
    return result;
}


- (void)dismissModalVC {
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end

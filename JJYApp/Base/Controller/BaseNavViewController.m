//
//  BaseNavViewController.m
//  QXBApp
//
//  Created by ZQT on 2019/6/18.
//  Copyright © 2019年 TG. All rights reserved.
//

#import "BaseNavViewController.h"
#import "UIImage+Color.h"
@interface BaseNavViewController ()<UIGestureRecognizerDelegate>

@end

@implementation BaseNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.enableRightGesture = YES;
    self.interactivePopGestureRecognizer.delegate = self;
    [self configureNavBarTheme];
}


- (void)configureNavBarTheme {
    self.navigationBar.tintColor = BlackColor;
    // 设置导航栏的标题颜色，字体
    NSDictionary* textAttrs = @{NSForegroundColorAttributeName:
                                    BlackColor,
                                NSFontAttributeName:
                                    [UIFont fontWithName:@"Helvetica"size:17.0],
                                };
    [self.navigationBar setTitleTextAttributes:textAttrs];
    //设置导航栏的背景图片
    [self.navigationBar setBackgroundImage:[self imageWithColor:WhiteColor] forBarMetrics:UIBarMetricsDefault];
    // 去掉导航栏底部阴影
    [self.navigationBar setShadowImage:[[UIImage alloc] init]];
    
}

- (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = (CGRect){CGPointZero,CGSizeMake(1.0, 1.0)};
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if (self.viewControllers.count <= 1) {
        return NO;
    }
    return self.enableRightGesture;
}

#pragma mark - override

//// override pushViewController
//- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
//{
//    if (self.viewControllers.count >= 1) {
//        viewController.hidesBottomBarWhenPushed = YES;
//        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"backBtnIcon"] style:UIBarButtonItemStylePlain target:self action:@selector(navGoBack)];
//    }
//    [super pushViewController:viewController animated:animated];
//}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.viewControllers.count > 0) {
        NSString *backStr = @"blackIcon";
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [backButton setImage:[UIImage imageNamed:backStr] forState:UIControlStateNormal];
        [backButton setImage:[UIImage imageNamed:backStr] forState:UIControlStateHighlighted];
        [backButton addTarget:self action:@selector(gotoBack) forControlEvents:UIControlEventTouchUpInside];
        //        backButton.frame = (CGRect){CGPointZero,backButton.currentBackgroundImage.size};
        backButton.frame = CGRectMake(0, 0, 50, 50);
        
        backButton.imageEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
        // 设置返回按钮
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
//        NSString *title = @"返回";
//        title = [[self topViewController] navigationItem].title?:@"返回";
//        [backButton setTitle:title forState:UIControlStateNormal];
//        [backButton setTitleColor:Color_333 forState:UIControlStateNormal];
        // 1.自动显示和隐藏tabbar
        viewController.hidesBottomBarWhenPushed = YES;
    } else {
        viewController.hidesBottomBarWhenPushed = NO;
    }
    
    
    [super pushViewController:viewController animated:animated];
}


#pragma mark - action

- (void)gotoBack
{
    [self popViewControllerAnimated:YES];
}


@end

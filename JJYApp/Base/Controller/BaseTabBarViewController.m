//
//  BaseTabBarViewController.m
//  QXBApp
//
//  Created by ZQT on 2019/6/18.
//  Copyright © 2019年 TG. All rights reserved.
//

#import "BaseTabBarViewController.h"
#import "HomeViewController.h"
#import "BaseNavViewController.h"



@interface BaseTabBarViewController ()

@end

@implementation BaseTabBarViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.tabBarItemsAttributes = [self tabBarItemsAttributesForController];
        //设置控制器数组
        self.viewControllers = [self mpViewControllers];
        self.delegate = self;
        self.moreNavigationController.navigationBarHidden = YES;
        [self.tabBar setTintColor:MainColor];
        
       [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:Color_333} forState:UIControlStateNormal];
        
        [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:MainColor} forState:UIControlStateSelected];
   
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

//控制器设置
- (NSArray *)mpViewControllers {
    
    HomeViewController *firstViewController = [[HomeViewController alloc] init];
    UINavigationController *firstNavigationController = [[BaseNavViewController alloc]
                                                         initWithRootViewController:firstViewController];
    
    
    
    HomeViewController *secondViewController = [[HomeViewController alloc] init];
    UINavigationController *secondNavigationController = [[BaseNavViewController alloc]
                                                          initWithRootViewController:secondViewController];
    
    
    HomeViewController *thirdViewController = [[HomeViewController alloc] init];
    UINavigationController *thirdNavigationController = [[BaseNavViewController alloc]
                                                          initWithRootViewController:thirdViewController];
    
    
    
    
    HomeViewController *fourthViewController = [[HomeViewController alloc] init];
    UINavigationController *fourthNavigationController = [[BaseNavViewController alloc]
                                                          initWithRootViewController:fourthViewController];
    
    
    NSArray *viewControllers = @[firstNavigationController,
                                 secondNavigationController,
                                 thirdNavigationController,
                                 fourthNavigationController
                                 ];
    return viewControllers;
}

//TabBar文字跟图标设置
- (NSArray *)tabBarItemsAttributesForController {
    NSDictionary *firstTabBarItemsAttributes = @{
                                                 CYLTabBarItemTitle : @"1",
                                                 CYLTabBarItemImage : @"tabbar_first",
                                                 CYLTabBarItemSelectedImage : @"tabbar_first_selected",
                                                 };
    NSDictionary *secondTabBarItemsAttributes = @{
                                                  CYLTabBarItemTitle : @"2",
                                                  CYLTabBarItemImage : @"tabbar_second",
                                                  CYLTabBarItemSelectedImage : @"tabbar_second_selected",
                                                  };
    NSDictionary *thirdTabBarItemsAttributes = @{
                                                  CYLTabBarItemTitle : @"3",
                                                  CYLTabBarItemImage : @"tabbar_third",
                                                  CYLTabBarItemSelectedImage : @"tabbar_third_selected",
                                                  };
    NSDictionary *fourthTabBarItemsAttributes = @{
                                                  CYLTabBarItemTitle : @"4",
                                                  CYLTabBarItemImage : @"tabbar_fourth",
                                                  CYLTabBarItemSelectedImage : @"tabbar_fourth_selected",
                                                  };
    NSArray *tabBarItemsAttributes= @[
                                      firstTabBarItemsAttributes,
                                      secondTabBarItemsAttributes,
                                      thirdTabBarItemsAttributes,
                                      fourthTabBarItemsAttributes
                                      ];
    
    return tabBarItemsAttributes;
}

#pragma mark - UITabBarControllerDelegate

- (BOOL)tabBarController:(UITabBarController*)tabBarController shouldSelectViewController:(UINavigationController*)viewController {

    
    
    return YES;
}

@end

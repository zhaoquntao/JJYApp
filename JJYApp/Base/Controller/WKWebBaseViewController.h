//
//  WKWebBaseViewController.h
//  FCity
//
//  Created by ZQT on 2018/7/24.
//  Copyright © 2018年 ZQT. All rights reserved.
//

#import "BaseViewController.h"
#import <WebKit/WKWebView.h>
#import <WebKit/WebKit.h>
#import "TGWebProgressLayer.h"

@interface WKWebBaseViewController : BaseViewController

@property (nonatomic, strong)TGWebProgressLayer *webProgressLayer;

@property (nonatomic, strong)WKWebView *tgWebView;
/** 相关链接*/
@property (nonatomic, copy) NSString *webUrl;

/** 标题 */
@property (nonatomic, copy) NSString *webTitle;

/** 进度条颜色 */
@property (nonatomic, assign) UIColor *progressColor;


@property (nonatomic, copy)NSString *backRootVC;// 是否返回根部 默认NO不返还  YES返回根部


-(void)updateNavigationItems;


@end

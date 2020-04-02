//
//  WKWebBaseViewController.m
//  FCity
//
//  Created by ZQT on 2018/7/24.
//  Copyright © 2018年 ZQT. All rights reserved.
//

#import "WKWebBaseViewController.h"



@interface WKWebBaseViewController ()<WKNavigationDelegate,WKUIDelegate,UINavigationControllerDelegate,WKScriptMessageHandler>


@property (nonatomic)UIBarButtonItem* customBackBarItem;
//关闭按钮
@property (nonatomic)UIBarButtonItem* closeButtonItem;


@property (nonatomic)UIBarButtonItem* rightButtonItem;

@end

@implementation WKWebBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationItem.title = self.webTitle;
//    self.backRootVC = @"NO";
    [self setUpUI];
    
    if (self.webUrl) {
        NSString *newUrlStr = [self.webUrl encodingWitUrl];

        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:newUrlStr]];
        [self.tgWebView loadRequest:request];
    }
}

- (void)setUpUI {
    [self.view addSubview:self.tgWebView];
    if (self.progressColor) {
        self.webProgressLayer.strokeColor = self.progressColor.CGColor;
    } else {
        self.webProgressLayer.strokeColor = kUIColorFromRGB(0x4F4F60).CGColor;
    }
    [self.navigationController.navigationBar.layer addSublayer:self.webProgressLayer];
}



- (void)closeItemClicked {

    [self.navigationController popViewControllerAnimated:YES];
}

- (void)customBackClicked {
    
    
    
    if (self.tgWebView.goBack) {
        [self.tgWebView goBack];
    }else{
        if ([self.backRootVC isEqualToString:@"YES"]) {
            [self.navigationController popToRootViewControllerAnimated:YES];
        } else {
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
}

-(void)updateNavigationItems{
    if (self.tgWebView.canGoBack) {
        [self.navigationItem setLeftBarButtonItems:@[self.customBackBarItem,self.closeButtonItem] animated:NO];
    }else{
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
        [self.navigationItem setLeftBarButtonItems:@[self.customBackBarItem]];
    }
}

#pragma mark - UIWebViewDelegate
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    [self.webProgressLayer tg_startLoad];
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    [self.webProgressLayer tg_finishedLoadWithError:nil];
    
    // 获取加载网页的标题
    self.navigationItem.title = self.tgWebView.title;
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    [self updateNavigationItems];
    
//    if ([self.tgWebView.title isEqualToString:@"立即还款"]) {
//        [self.navigationItem setRightBarButtonItems:@[self.rightButtonItem]];
//    } else {
//        [self.navigationItem setRightBarButtonItems:@[]];
//    }

}
//跳转失败的时候调用
-(void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error{
    
}

//内容返回时调用
-(void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
    
}

//服务器请求跳转的时候调用
-(void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation{}


//服务器开始请求的时候调用
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    // 获取完整url并进行UTF-8转码
    NSString *strRequest = [navigationAction.request.URL.absoluteString stringByRemovingPercentEncoding];
    if ([strRequest hasPrefix:@"shouaapp:"]) {
        
        // 不允许跳转
        decisionHandler(WKNavigationActionPolicyCancel);
    }else {
        // 允许跳转
        decisionHandler(WKNavigationActionPolicyAllow);
        
    }
}

// 内容加载失败时候调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    [self.webProgressLayer tg_finishedLoadWithError:error];
    [self updateNavigationItems];
}


#pragma mark ================ WKScriptMessageHandler ================

//拦截执行网页中的JS方法
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message{
    
    //服务器固定格式写法 window.webkit.messageHandlers.名字.postMessage(内容);
    //客户端写法 message.name isEqualToString:@"名字"]
    if ([message.name isEqualToString:@"WXPay"]) {
        NSLog(@"%@", message.body);
        //调用微信支付方法
        //        [self WXPayWithParam:message.body];
    }
}
#pragma mark ================ 懒加载 ================

- (WKWebView *)tgWebView{
    if (!_tgWebView) {
        //设置网页的配置文件
        WKWebViewConfiguration * Configuration = [[WKWebViewConfiguration alloc]init];
        //允许视频播放
        Configuration.allowsAirPlayForMediaPlayback = YES;
        // 允许在线播放
        Configuration.allowsInlineMediaPlayback = YES;
        // 允许可以与网页交互，选择视图
        Configuration.selectionGranularity = YES;
        // web内容处理池
        Configuration.processPool = [[WKProcessPool alloc] init];
        //自定义配置,一般用于 js调用oc方法(OC拦截URL中的数据做自定义操作)
        WKUserContentController * UserContentController = [[WKUserContentController alloc]init];
        // 添加消息处理，注意：self指代的对象需要遵守WKScriptMessageHandler协议，结束时需要移除
//        [UserContentController addScriptMessageHandler:self name:@"WXPay"];
        // 是否支持记忆读取
        Configuration.suppressesIncrementalRendering = YES;
        // 允许用户更改网页的设置
        Configuration.userContentController = UserContentController;
        self.tgWebView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - kWRNavBarBottom) configuration:Configuration];
        self.tgWebView.navigationDelegate =self;
        self.tgWebView.UIDelegate = self;
        self.tgWebView.allowsBackForwardNavigationGestures = YES;
//        [self.tgWebView sizeToFit];
//        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.url]];
//        [self.tgWebView loadRequest:request];
    }
    return _tgWebView;
}

- (TGWebProgressLayer *)webProgressLayer{
    if (!_webProgressLayer) {
        self.webProgressLayer = [[TGWebProgressLayer alloc] init];
        self.webProgressLayer.frame = CGRectMake(0, 42, WIDTH, 2);
        
    }
    return _webProgressLayer;
}

-(UIBarButtonItem*)customBackBarItem{
    if (!_customBackBarItem) {
        UIButton *backButton = [[UIButton alloc] init];
        [backButton setImage:[UIImage imageNamed:@"blackbackIcon"] forState:UIControlStateNormal];
        [backButton setImage:[UIImage imageNamed:@"blackbackIcon"] forState:UIControlStateHighlighted];
        backButton.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        backButton.frame = CGRectMake(0, 0, 40, 40);
        [backButton addTarget:self action:@selector(customBackClicked) forControlEvents:UIControlEventTouchUpInside];
        _customBackBarItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    }
    return _customBackBarItem;
}

-(UIBarButtonItem*)closeButtonItem{
    if (!_closeButtonItem) {
        UIButton *closeButton = [[UIButton alloc] init];
        [closeButton setImage:[UIImage imageNamed:@"black_closeIcon"] forState:UIControlStateNormal];
        [closeButton setImage:[UIImage imageNamed:@"black_closeIcon"] forState:UIControlStateHighlighted];
        closeButton.frame = CGRectMake(0, 0, 40, 40);
        closeButton.imageEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
//        [closeButton sizeToFit];
         [closeButton addTarget:self action:@selector(closeItemClicked) forControlEvents:UIControlEventTouchUpInside];
        _closeButtonItem = [[UIBarButtonItem alloc] initWithCustomView:closeButton];
    }
    return _closeButtonItem;
}


- (void)dealloc {
    [self.webProgressLayer tg_closeTimer];
    [_webProgressLayer removeFromSuperlayer];
    _webProgressLayer = nil;
}



@end

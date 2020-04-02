//
//  NetworkErrorStatus.m
//  YYApp
//
//  Created by 赵群涛 on 2019/9/19.
//  Copyright © 2019 ZQT. All rights reserved.
//

#import "NetworkErrorStatus.h"

@implementation NetworkErrorStatus

+ (NSString *)networkErrorStatusNSError:(NSError *)error withStatusL:(NSString *)titleL {
    
    NSString *statusLable = nil;
    NSLog(@"%@",error);
    NSString *str = @"com.alamofire.serialization.response.error.data";
    NSData *data = [[error userInfo] objectForKey:str];
    if (data == nil) {
        statusLable = titleL;
        
    }else{
        //JSON解析
        NSMutableDictionary *dicJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        statusLable = dicJSON[@"resuDesc"];
        
    }
    
    return statusLable;
}

@end

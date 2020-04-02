//
//  NetworkErrorStatus.h
//  YYApp
//
//  Created by 赵群涛 on 2019/9/19.
//  Copyright © 2019 ZQT. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NetworkErrorStatus : NSObject

+ (NSString *)networkErrorStatusNSError:(NSError *)error withStatusL:(NSString *)titleL;


@end

NS_ASSUME_NONNULL_END

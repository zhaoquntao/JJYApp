//
//  BaseTableViewController.h
//  QXBApp
//
//  Created by ZQT on 2019/7/1.
//  Copyright © 2019 TG. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseTableViewController : BaseViewController

@property (nonatomic, strong)UITableView *tableView;

@property (nonatomic, strong)NSMutableArray *dataArray;



@end

NS_ASSUME_NONNULL_END

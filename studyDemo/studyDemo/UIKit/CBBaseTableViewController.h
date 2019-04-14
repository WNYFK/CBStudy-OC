//
//  CBBaseTableViewController.h
//  studyDemo
//
//  Created by chenbin on 2019/4/14.
//  Copyright © 2019 ChenBin. All rights reserved.
//

#import "CBBaseViewController.h"
#import "CBBaseCellItem.h"
NS_ASSUME_NONNULL_BEGIN

@interface CBBaseTableViewController : CBBaseViewController

@property (nonatomic, strong) NSMutableArray<CBBaseCellItem *> *cellItems;
@property (nonatomic, strong, readonly) UITableView *tableView;

@end

NS_ASSUME_NONNULL_END

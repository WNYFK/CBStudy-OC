//
//  CBBaseTableViewCell.h
//  studyDemo
//
//  Created by chenbin on 2019/4/14.
//  Copyright © 2019 ChenBin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class CBBaseCellItem;

@interface CBBaseTableViewCell : UITableViewCell
@property (nonatomic, strong) CBBaseCellItem *item;
@end

NS_ASSUME_NONNULL_END

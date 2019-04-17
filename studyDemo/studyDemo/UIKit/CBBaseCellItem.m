//
//  CBBaseCellItem.m
//  studyDemo
//
//  Created by chenbin on 2019/4/14.
//  Copyright © 2019 ChenBin. All rights reserved.
//

#import "CBBaseCellItem.h"
#import "CBBaseTableViewCell.h"

@implementation CBBaseCellItem

- (instancetype)initWithTitle:(NSString *)title cellClass:(Class)cellClass clickBlock:(CBCellClickBlock)clickBlock {
    if (self = [super init]) {
        self.title = title;
        self.cellClass = cellClass;
        self.clickBlock = clickBlock;
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title clickBlock:(CBCellClickBlock)clickBlock {
    return [self initWithTitle:title cellClass:CBBaseTableViewCell.class clickBlock:clickBlock];
}

@end

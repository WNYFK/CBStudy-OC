//
//  CBBaseTableViewCell.m
//  studyDemo
//
//  Created by chenbin on 2019/4/14.
//  Copyright © 2019 ChenBin. All rights reserved.
//

#import "CBBaseTableViewCell.h"
#import "CBBaseCellItem.h"

@interface CBBaseTableViewCell ()

@property (nonatomic, strong) UILabel *titleLab;

@end

@implementation CBBaseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.titleLab = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 200, 20)];
        self.titleLab.textColor = UIColor.blackColor;
        [self.contentView addSubview:self.titleLab];
    }
    return self;
}

- (void)setItem:(CBBaseCellItem *)item {
    _item = item;
    self.titleLab.text = item.title;
}

@end

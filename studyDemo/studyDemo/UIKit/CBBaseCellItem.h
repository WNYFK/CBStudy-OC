//
//  CBBaseCellItem.h
//  studyDemo
//
//  Created by chenbin on 2019/4/14.
//  Copyright © 2019 ChenBin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^CBCellClickBlock)(void);

@interface CBBaseCellItem : NSObject

@property (nonatomic, strong) Class cellClass;
@property (nonatomic, copy) CBCellClickBlock clickBlock;
@property (nonatomic, strong) NSString *title;

- (instancetype)initWithTitle:(NSString *)title cellClass:(Class)cellClass clickBlock:(CBCellClickBlock)clickBlock;
- (instancetype)initWithTitle:(NSString *)title clickBlock:(CBCellClickBlock)clickBlock;

@end

NS_ASSUME_NONNULL_END

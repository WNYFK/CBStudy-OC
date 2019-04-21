//
//  GCDTimer.h
//  studyDemo
//
//  Created by chenbin on 2019/4/21.
//  Copyright © 2019 ChenBin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GCDTimer : NSObject

- (void)resume;
- (void)cancel;

+ (instancetype)timerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(void))block;
+ (instancetype)scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(void))block;
@end

NS_ASSUME_NONNULL_END

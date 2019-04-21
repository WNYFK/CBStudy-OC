//
//  GCDTimer.m
//  studyDemo
//
//  Created by chenbin on 2019/4/21.
//  Copyright © 2019 ChenBin. All rights reserved.
//

#import "GCDTimer.h"

@interface GCDTimer()
@property (nonatomic, strong) dispatch_source_t timer;

@end

@implementation GCDTimer

+ (instancetype)timerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(void))block {
    
    GCDTimer *timer = [GCDTimer new];
    timer.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
    dispatch_source_set_timer(timer.timer, dispatch_walltime(NULL, 0), interval * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(timer.timer, ^{
        block();
        if (!repeats) {
            [timer cancel];
        }
    });
    return timer;
}

+ (instancetype)scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(void))block {
    GCDTimer *timer = [GCDTimer timerWithTimeInterval:interval repeats:repeats block:block];
    [timer resume];
    return timer;
}

- (void)resume {
    dispatch_resume(_timer);
}

- (void)cancel {
    dispatch_cancel(_timer);
    _timer = nil;
}

@end

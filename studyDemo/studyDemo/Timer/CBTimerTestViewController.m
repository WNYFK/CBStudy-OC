//
//  CBTimerTestViewController.m
//  studyDemo
//
//  Created by ChenBin on 2019/4/19.
//  Copyright © 2019 ChenBin. All rights reserved.
//

#import "CBTimerTestViewController.h"
#import <Masonry.h>
#import "GCDTimer.h"

@interface CBTimerTestViewController ()

@property (nonatomic, strong) NSTimer *timer1;
@property (nonatomic, strong) NSTimer *timer2;
@property (nonatomic, strong) UIButton *timerBtn;

@property (nonatomic, strong) GCDTimer *gcdTimer;
@property (nonatomic, strong) UIButton *gcdTimerBtn;

@property (nonatomic, strong) CADisplayLink *displayLink;
@property (nonatomic, strong) UIButton *displayLinkBtn;

@end

@implementation CBTimerTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.timerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.timerBtn setTitle:@"timer Start" forState:UIControlStateNormal];
    [self.timerBtn setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [_timerBtn addTarget:self action:@selector(timerStart) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_timerBtn];
    [_timerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(60));
        make.left.equalTo(@(60));
        make.right.equalTo(@(-60));
    }];
    
    self.gcdTimerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.gcdTimerBtn setTitle:@"GCD start" forState:UIControlStateNormal];
    [self.gcdTimerBtn setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [self.gcdTimerBtn addTarget:self action:@selector(gcdTimerStart) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.gcdTimerBtn];
    [self.gcdTimerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.timerBtn);
        make.top.equalTo(self.timerBtn.mas_bottom).offset(30);
    }];
    
    self.displayLinkBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.displayLinkBtn setTitle:@"DisplayLink start" forState:UIControlStateNormal];
    [self.displayLinkBtn setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [self.displayLinkBtn addTarget:self action:@selector(displayLinkStart) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.displayLinkBtn];
    [self.displayLinkBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.timerBtn);
        make.top.equalTo(self.gcdTimerBtn.mas_bottom).offset(30);
    }];
}

- (void)timerStart {
    if (self.timer1) {
        [self.timer1 invalidate];
        [self.timer2 invalidate];
        [self.timerBtn setTitle:@"timer start" forState:UIControlStateNormal];
        self.timer1 = nil;
        self.timer2 = nil;
    } else {
        self.timer1 = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
            NSLog(@"NSTimer scheduledTimer");
        }];
        self.timer2 = [NSTimer timerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
            NSLog(@"NSTimer timer");
        }];
        [[NSRunLoop currentRunLoop] addTimer:self.timer2 forMode:NSRunLoopCommonModes];
        [self.timerBtn setTitle:@"timer stop" forState:UIControlStateNormal];
    }
}

- (void)gcdTimerStart {
    if (self.gcdTimer) {
        [self.gcdTimer cancel];
        [self.gcdTimerBtn setTitle:@"GCD start" forState:UIControlStateNormal];
        self.gcdTimer = nil;
    } else {
        self.gcdTimer = [GCDTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^{
            NSLog(@"gcd timer");
        }];
        [self.gcdTimerBtn setTitle:@"gcd timer stop" forState:UIControlStateNormal];
    }
}

- (void)displayLinkStart {
    if (self.displayLink) {
        [self.displayLink invalidate];
        self.displayLink = nil;
        [self.displayLinkBtn setTitle:@"DisplayLink start" forState:UIControlStateNormal];
    } else {
        self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(displayLinkHandle)];
        self.displayLink.preferredFramesPerSecond = 1;
        [self.displayLink addToRunLoop:NSRunLoop.mainRunLoop forMode:NSRunLoopCommonModes];
        [self.displayLinkBtn setTitle:@"displaylink stop" forState:UIControlStateNormal];
    }
}

- (void)displayLinkHandle {
    NSLog(@"displayLink");
}



@end

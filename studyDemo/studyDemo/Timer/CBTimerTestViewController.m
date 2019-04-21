//
//  CBTimerTestViewController.m
//  studyDemo
//
//  Created by ChenBin on 2019/4/19.
//  Copyright © 2019 ChenBin. All rights reserved.
//

#import "CBTimerTestViewController.h"
#import <Masonry.h>


@interface CBTimerTestViewController ()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) UIButton *timerBtn;

@property (nonatomic, strong) UIButton *gcdTimerBtn;

@property (nonatomic, strong) UIButton *displayLinkBtn;

@end

@implementation CBTimerTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.timerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.timerBtn setTitle:@"timer Start" forState:UIControlStateNormal];
    [_timerBtn addTarget:self action:@selector(timerStart) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_timerBtn];
    [_timerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(60));
        make.left.equalTo(@(60));
        make.right.equalTo(@(-60));
    }];
    
    self.gcdTimerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.gcdTimerBtn setTitle:@"GCD start" forState:UIControlStateNormal];
    [self.gcdTimerBtn addTarget:self action:@selector(gcdTimerStart) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.gcdTimerBtn];
    [self.gcdTimerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.timerBtn);
        make.top.equalTo(self.timerBtn.mas_bottom).offset(30);
    }];
    
    self.displayLinkBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.displayLinkBtn setTitle:@"DisplayLink start" forState:UIControlStateNormal];
    [self.displayLinkBtn addTarget:self action:@selector(displayLinkStart) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.displayLinkBtn];
    [self.displayLinkBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.timerBtn);
        make.top.equalTo(self.gcdTimerBtn.mas_bottom).offset(30);
    }];
}

- (void)timerStart {
    
}

- (void)gcdTimerStart {
    
}

- (void)displayLinkStart {
    
}



@end

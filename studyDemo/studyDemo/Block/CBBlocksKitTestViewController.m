//
//  CBBlocksKitTestViewController.m
//  studyDemo
//
//  Created by ChenBin on 2019/5/6.
//  Copyright © 2019 ChenBin. All rights reserved.
//

#import "CBBlocksKitTestViewController.h"
#import <NSObject+BKBlockObservation.h>
#import "GCDTimer.h"

@interface CBBlocksKitTestViewController ()

@property (nonatomic, strong) NSString *name;

@end

@implementation CBBlocksKitTestViewController

- (void)dealloc {
    NSLog(@"dealloc");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self bk_addObserverForKeyPath:@"name" task:^(id target) {
        NSLog(@"%@",target);
    }];
//    [GCDTimer scheduledTimerWithTimeInterval:5 repeats:YES block:^{
//        self.name = [NSString stringWithFormat:@"11%@",self.name];
//    }];
}


@end

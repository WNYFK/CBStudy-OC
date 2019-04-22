//
//  CBHomeViewController.m
//  studyDemo
//
//  Created by chenbin on 2019/4/14.
//  Copyright © 2019 ChenBin. All rights reserved.
//

#import "CBHomeViewController.h"
#import "CBMemoryFirstViewController.h"
#import "CBGestureTestViewController.h"
#import "CBTimerTestViewController.h"
#import "CBAspectsViewController.h"

@interface CBHomeViewController ()


@end

@implementation CBHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    self.navigationItem.title = @"主页";
    CBBaseCellItem *memoryLeaksItem = [[CBBaseCellItem alloc] initWithTitle:@"内存检测" clickBlock:^{
        [self.navigationController pushViewController:[CBMemoryFirstViewController new] animated:YES];
    }];
    CBBaseCellItem *gestureItem = [[CBBaseCellItem alloc] initWithTitle:@"手势" clickBlock:^{
        [self.navigationController pushViewController:[CBGestureTestViewController new] animated:YES];
    }];
    CBBaseCellItem *timerItem = [[CBBaseCellItem alloc] initWithTitle:@"Timer i相关" clickBlock:^{
        [self.navigationController pushViewController:CBTimerTestViewController.new animated:YES];
    }];
    CBBaseCellItem *aspectsItem = [[CBBaseCellItem alloc] initWithTitle:@"Aspects" clickBlock:^{
        [self.navigationController pushViewController:CBAspectsViewController.new animated:YES];
    }];
    self.cellItems = [NSMutableArray arrayWithObjects:memoryLeaksItem, gestureItem, timerItem, aspectsItem, nil];
}


@end

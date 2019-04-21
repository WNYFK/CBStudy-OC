//
//  CBGestureTestViewController.m
//  studyDemo
//
//  Created by ChenBin on 2019/4/19.
//  Copyright © 2019 ChenBin. All rights reserved.
//

#import "CBGestureTestViewController.h"
#import "UIScreen+Addition.h"

@interface CBGestureTestViewController ()<UIGestureRecognizerDelegate>

@end

@implementation CBGestureTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CBBaseCellItem *item = [[CBBaseCellItem alloc] initWithTitle:@"item" clickBlock:nil];
    self.cellItems = [[NSMutableArray alloc] initWithObjects:item, item, item, item, item, item, item, item, item, nil];
    
    UIView *headerView = [[UIView alloc] initWithFrame: CGRectMake(0, 0, UIScreen.width, 200)];
    UISwipeGestureRecognizer *swipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeHandle:)];
    swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionUp;
    swipeGestureRecognizer.delegate = self;
    [headerView addGestureRecognizer:swipeGestureRecognizer];
    self.tableView.tableHeaderView = headerView;
//    [self.tableView.panGestureRecognizer requireGestureRecognizerToFail:swipeGestureRecognizer];
}

- (void)swipeHandle:(UISwipeGestureRecognizer *)recognizer {
    if (recognizer.direction == UISwipeGestureRecognizerDirectionDown) {
        NSLog(@"下");
    } else {
        NSLog(@"上");
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

@end

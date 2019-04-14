//
//  CBMemoryFirstViewController.m
//  studyDemo
//
//  Created by chenbin on 2019/4/14.
//  Copyright © 2019 ChenBin. All rights reserved.
//

#import "CBMemoryFirstViewController.h"
#import "CBMemoryView.h"
#import "CBMemoryObject.h"

typedef void(^CBCallBackBlock)(void);

@interface CBMemoryFirstViewController ()

@property (nonatomic, copy) CBCallBackBlock callback;

@end

@implementation CBMemoryFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.callback = ^{
        NSLog(@"%@", self);
    };
    
//    CBMemoryView *mmView = [CBMemoryView new];
//    mmView.object = self;
//    [self.view addSubview:mmView];
//    
//    CBMemoryObject *mmObject = [CBMemoryObject new];
//    mmObject.object = mmObject;
    
    
    
}

@end

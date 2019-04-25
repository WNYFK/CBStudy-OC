//
//  CBBlockTestViewController.m
//  studyDemo
//
//  Created by ChenBin on 2019/4/25.
//  Copyright © 2019 ChenBin. All rights reserved.
//

#import "CBBlockTestViewController.h"

typedef void(^CBBlock)(NSObject *);

@interface CBBlockTestViewController ()

@end

@implementation CBBlockTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CBBlock block = [self getBlock];
    block([NSObject new]);
    block([NSObject new]);

    block([NSObject new]);
    block([NSObject new]);
    block([NSObject new]);
    
    NSMutableArray *array = [NSMutableArray array];
    NSLog(@"==========%p", &array);
    CBBlock blcok1 = ^(NSObject *obj) {
//        [array addObject:obj];
        NSLog(@"11111111111%p",&array);
    };
    blcok1(NSObject.new);
    blcok1(NSObject.new);
    NSLog(@"%@",array);

}

- (CBBlock)getBlock {
    NSMutableArray *array = [NSMutableArray array];
    NSLog(@"%p",&array);

    return ^(NSObject *obj) {
        [array addObject:obj];
        NSLog(@"%lu",(unsigned long)array.count);
        NSLog(@"array:%p", &array);
    };
}


@end

//
//  CBBlockTestViewController.m
//  studyDemo
//
//  Created by ChenBin on 2019/4/25.
//  Copyright © 2019 ChenBin. All rights reserved.
//

#import "CBBlockTestViewController.h"

//https://desgard.gitbooks.io/source-probe/content/Objective-C/Runtime/%E6%B5%85%E8%B0%88%20block%EF%BC%882%EF%BC%89%20-%20%E6%88%AA%E8%8E%B7%E5%8F%98%E9%87%8F%E6%96%B9%E5%BC%8F.html
//http://ju.outofmemory.cn/entry/305053
//https://www.zybuluo.com/MicroCai/note/51116

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

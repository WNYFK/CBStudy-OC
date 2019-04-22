//
//  CBAspectsViewController.m
//  studyDemo
//
//  Created by ChenBin on 2019/4/22.
//  Copyright © 2019 ChenBin. All rights reserved.
//

#import "CBAspectsViewController.h"
#import <Aspects.h>

@interface CBAspectsTestBaseObject : NSObject

- (void)superMethod;

@end

@interface CBAspectsTestObject : CBAspectsTestBaseObject
@property (nonatomic, strong) NSString *name;

- (void)testMethod;

@end

@interface CBAspectsViewController ()

@end

@implementation CBAspectsViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear");
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    [CBAspectsViewController aspect_hookSelector:@selector(viewDidAppear:) withOptions:AspectPositionAfter usingBlock:^{
//        NSLog(@"aspect_viewDidAppear");
//    } error:nil];
//    [self aspect_hookSelector:@selector(viewDidAppear:) withOptions:AspectPositionBefore usingBlock:^{
//        NSLog(@"aspect_viewdidAppear before");
//    } error:nil];
    
    CBAspectsTestObject *testObj1 = [CBAspectsTestObject new];
    testObj1.name = @"testObj1 name";
    CBAspectsTestObject *testObj2 = [CBAspectsTestObject new];
    testObj2.name = @"testObj2 name";
//    [CBAspectsTestObject aspect_hookSelector:@selector(testMethod) withOptions:AspectPositionBefore usingBlock:^{
//        NSLog(@"meta Class aspect before");
//    } error:nil];
//    [testObj1 aspect_hookSelector:@selector(testMethod) withOptions:AspectPositionAfter usingBlock:^{
//        NSLog(@"CBAspectsTestObject test");
//    } error:nil];
//    [testObj2 aspect_hookSelector:@selector(testMethod) withOptions:AspectPositionAfter usingBlock:^{
//        NSLog(@"testObj2 aspect test");
//    } error:nil];
    
    [CBAspectsTestObject aspect_hookSelector:@selector(superMethod) withOptions:AspectPositionAfter usingBlock:^{
        NSLog(@"superMethod aspects");
    } error:nil];
    [testObj1 aspect_hookSelector:@selector(superMethod) withOptions:AspectPositionAfter usingBlock:^{
        NSLog(@"test superMethod aspects");
    } error:nil];
    [testObj2 aspect_hookSelector:@selector(superMethod) withOptions:AspectPositionAfter usingBlock:^{
        NSLog(@"test obj2 superMethod aspects");
    } error:nil];
    [testObj1 superMethod];
    [testObj2 superMethod];
//    [testObj1 testMethod];
//    [testObj2 testMethod];
    
}

- (void)aspect_viewDidAppear:(BOOL)animated {
    [self aspect_viewDidAppear:animated];
    NSLog(@"aspect_viewDidAppear");
}

@end

@implementation CBAspectsTestObject

- (void)testMethod {
    NSLog(@"CBAspectsTestObject:%@",self.name);
}

@end

@implementation CBAspectsTestBaseObject

- (void)superMethod {
    NSLog(@"CBAspectsTestBaseOBject superMethod");
}

@end

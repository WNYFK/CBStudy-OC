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

+ (void)foo;
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
//    [CBAspectsTestObject foo];
//    [[CBAspectsTestObject new] foo];
    CBAspectsTestObject *testObj1 = [CBAspectsTestObject new];
    testObj1.name = @"testObj1 name";
    CBAspectsTestObject *testObj2 = [CBAspectsTestObject new];
    testObj2.name = @"testObj2 name";
    NSLog(@"self.class:%@",testObj2.class);
    NSLog(@"isa class:%s",object_getClassName(testObj2));
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
    NSLog(@"hook self.class:%@",testObj2.class);
    NSLog(@"hook isa class:%s",object_getClassName(testObj2));
//    [testObj1 testMethod];
//    [testObj2 testMethod];
    
    BOOL res1 = [[NSObject class] isKindOfClass:[NSObject class]];
    NSLog(@"%d",res1);
}

- (void)aspect_viewDidAppear:(BOOL)animated {
    [self aspect_viewDidAppear:animated];
    NSLog(@"aspect_viewDidAppear");
}

@end

@implementation CBAspectsTestObject

- (void)foo {
    NSLog(@"IMP: -[CBAspectsTestObject foo]");
}
- (void)testMethod {
    NSLog(@"CBAspectsTestObject:%@",self.name);
}

@end

@implementation CBAspectsTestBaseObject

- (void)superMethod {
    NSLog(@"CBAspectsTestBaseOBject superMethod");
}

@end

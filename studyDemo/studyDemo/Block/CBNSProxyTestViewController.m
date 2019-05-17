//
//  CBNSProxyTestViewController.m
//  studyDemo
//
//  Created by ChenBin on 2019/5/11.
//  Copyright © 2019 ChenBin. All rights reserved.
//

#import "CBNSProxyTestViewController.h"

@interface CBProxy : NSProxy

@property (nonatomic, strong) id innerObject;

@end

@interface Dog : NSObject

- (NSString *)barking:(NSInteger)months;

@end

@interface CBNSProxyTestViewController ()

@property (nonatomic, strong) CBProxy *dog;

@end

@implementation CBNSProxyTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dog = [CBProxy alloc];
    _dog.innerObject = [Dog new];
    [(Dog *)_dog barking:4];
//    [dog barking:2];
}

@end

@implementation CBProxy

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    return [_innerObject methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    if (![_innerObject respondsToSelector:invocation.selector]) { return; }
    NSString *selName = NSStringFromSelector(invocation.selector);
    NSLog(@"Before calling %@",selName);
    [invocation retainArguments];
    NSMethodSignature *sig = [invocation methodSignature];
    NSUInteger cnt = [sig numberOfArguments];
    for (int i = 0; i < cnt; i++) {
        const char *type = [sig getArgumentTypeAtIndex:i];
        if(strcmp(type, "@") == 0) {
            NSObject *obj;
            [invocation getArgument:&obj atIndex:i];
            NSLog(@"parameter (%d) class is %@", i, obj.class);
        } else if (strcmp(type, ":") == 0) {
            SEL sel;
            [invocation getArgument:&sel atIndex:i];
            NSLog(@"parameter (%d) is %@", i, NSStringFromSelector(sel));
        } else if (strcmp(type, "q") == 0) {
            int arg = 0;
            [invocation getArgument:&arg atIndex:i];
            NSLog(@"parameter (%d) is int value is %d",i, arg);
        }
    }
    //消息转发
    [invocation invokeWithTarget:_innerObject];
    const char *retType = [sig methodReturnType];
    if (strcmp(retType, "@") == 0) {
        NSObject *ret;
        [invocation getReturnValue:&ret];
        NSLog(@"return value is %@", ret);
    }
    NSLog(@"After calling %@", selName);
}
@end

@implementation Dog

- (NSString *)barking:(NSInteger)months {
    return months > 3 ? @"wang wang!" : @"eng eng!";
}

@end

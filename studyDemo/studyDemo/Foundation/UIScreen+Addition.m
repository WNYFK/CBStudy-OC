//
//  UIScreen+Addition.m
//  studyDemo
//
//  Created by ChenBin on 2019/4/19.
//  Copyright © 2019 ChenBin. All rights reserved.
//

#import "UIScreen+Addition.h"

@implementation UIScreen(Addition)

+ (CGFloat)width {
    return [UIScreen mainScreen].bounds.size.width;
}

+ (CGFloat)height {
    return [UIScreen mainScreen].bounds.size.height;
}

@end

//
//  UIView+Addition.m
//  studyDemo
//
//  Created by ChenBin on 2019/4/19.
//  Copyright © 2019 ChenBin. All rights reserved.
//

#import "UIView+Addition.h"

@implementation UIView(Addition)

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
    self.frame = CGRectMake(self.left, self.top, width, self.height);
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height {
    self.frame = CGRectMake(self.left, self.top, self.width, height);
}

- (CGFloat)top {
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)top {
    self.frame = CGRectMake(self.left, top, self.width, self.height);
}

- (CGFloat)left {
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)left {
    self.frame = CGRectMake(left, self.top, self.width, self.height);
}

- (CGFloat)bottom {
    return self.top + self.height;
}

- (void)setBottom:(CGFloat)bottom {
    self.top = bottom - self.height;
}

- (CGFloat)right {
    return self.left + self.width;
}

- (void)setRight:(CGFloat)right {
    self.left = right - self.width;
}



@end

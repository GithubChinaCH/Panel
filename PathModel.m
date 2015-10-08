//
//  PathModel.m
//  Panel
//
//  Created by mac on 15/8/18.
//  Copyright (c) 2015年 chenhao. All rights reserved.
//

#import "PathModel.h"

@implementation PathModel

- (void)dealloc
{
    CGPathRelease(self.path);
}

- (void)setPath:(CGMutablePathRef)path
{
    if (_path != path) {
        _path = path;
        CGPathRetain(_path);
    }
}




@end

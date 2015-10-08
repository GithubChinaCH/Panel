//
//  Mylabel.m
//  Panel
//
//  Created by mac on 15/8/18.
//  Copyright (c) 2015年 chenhao. All rights reserved.
//

#import "Mylabel.h"

@implementation Mylabel

- (id)initWithFrame:(CGRect)frame Str:(NSString *)str
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.borderWidth = 2;
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 25;
        self.layer.borderColor = [UIColor orangeColor].CGColor;
        self.text = str;
        self.font = [UIFont boldSystemFontOfSize:20];
        self.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

@end

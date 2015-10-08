//
//  SelectorButton.m
//  Panel
//
//  Created by mac on 15/8/18.
//  Copyright (c) 2015年 chenhao. All rights reserved.
//

#import "SelectorButton.h"

@implementation SelectorButton

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.font = [UIFont systemFontOfSize:14.0];
    }
    return self;
}
- (void)drawRect:(CGRect)rect
{
    CGRect firFrame = rect;
    firFrame.origin.y += 5;
    rect = firFrame;
    [_mycolor set];
    
    //[self.title drawInRect:rect withAttributes:@{NSFontAttributeName : self.font}];
    [self.title drawInRect:rect withFont:self.font lineBreakMode:NSLineBreakByTruncatingTail alignment:NSTextAlignmentCenter];
    if (self.isSelected) {
        CGRect frame = CGRectMake(0, CGRectGetHeight(rect) - 2, CGRectGetWidth(rect), 2);
        [[UIColor redColor] setFill];
        UIRectFill(frame);
    }
   // UIRectFill(rect);
    
    
}

- (void)setIsSelected:(BOOL)isSelected
{
    _isSelected = isSelected;
    [self setNeedsDisplay];
}


@end

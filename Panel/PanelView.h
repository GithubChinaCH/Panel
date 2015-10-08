//
//  PanelView.h
//  Panel
//
//  Created by mac on 15/8/18.
//  Copyright (c) 2015年 chenhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PanelView : UIView
- (void)nextDo;
- (void)undo;
- (void)removeAll;
//画笔的颜色
@property (nonatomic, strong) UIColor *useColor;
//画笔的线宽
@property (nonatomic, assign) CGFloat lineWidth;
@property (nonatomic, strong) NSMutableArray *pathAry;
@end

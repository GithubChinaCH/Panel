//
//  ToolView.h
//  Panel
//
//  Created by mac on 15/8/18.
//  Copyright (c) 2015年 chenhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectorButton.h"

typedef void(^SelectColorBlack)(UIColor*);
typedef void(^LineWidthBlack)(CGFloat);
typedef void(^NoneBlock)();
@interface ToolView : UIView

@property (nonatomic, strong) UIButton *button;

@property (nonatomic, strong) SelectorButton *selectButton;
@property (nonatomic, strong) UIControl *colorControl;
@property (nonatomic, strong) UIButton *lineButton;
@property (nonatomic, strong) UIButton *cleatButton;
@property (nonatomic, strong) NSArray *lineWidth;
@property (nonatomic, strong) NSArray *clearAry;
//使用block进行类之间的交互
@property (nonatomic, copy) SelectColorBlack selectColor;
@property (nonatomic, copy) LineWidthBlack lineWidthblock;
@property (nonatomic, copy) NoneBlock undoblock;
@property (nonatomic, copy) NoneBlock removeAllBlock;
@property (nonatomic, copy) NoneBlock doNextBlock;
@end

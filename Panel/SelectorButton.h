//
//  SelectorButton.h
//  Panel
//
//  Created by mac on 15/8/18.
//  Copyright (c) 2015年 chenhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectorButton : UIControl

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) UIFont *font;
@property (nonatomic, assign) BOOL isSelected;
@property (nonatomic, strong) UIColor *mycolor;

@end

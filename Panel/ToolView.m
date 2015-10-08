//
//  ToolView.m
//  Panel
//
//  Created by mac on 15/8/18.
//  Copyright (c) 2015年 chenhao. All rights reserved.
//

#import "ToolView.h"
#import "PanelView.h"
#import "Mylabel.h"

@interface ToolView ()<UIAlertViewDelegate>

@end

@implementation ToolView
{
    UIView *_buttonView;  //顶部底部视图
    UIView *_colorView;   //颜色底部视图
    UIView *_lineView;    //线宽底部视图
    UIView *_undoView;
    UIView *_clearView;
    UIView *_allView;
    
    UIAlertView *_view;
    
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //创建按钮视图
        [self _creatButtonView];
        //创建颜色视图
        [self _creatColorView];
        //创建线条底部视图
        [self _createLinesView];
        //创建橡皮擦视图
        [self _creatClearView];
        //创建撤销视图
        [self _creatUnDoView];
        //全部移除视图
        [self _creatRemoveAllView];
    }
    return self;
}
- (void)_creatRemoveAllView
{
    _allView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_buttonView.frame), self.frame.size.width, 60)];
    _allView.backgroundColor = [UIColor clearColor];
    [self addSubview:_allView];
    _allView.hidden = YES;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(30, 0, 315, 50);
    [button setTitle: @"全部清除🆑" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont boldSystemFontOfSize:30];
    button.layer.masksToBounds = YES;
    button.layer.borderWidth = 5;
    button.layer.borderColor = [UIColor lightTextColor].CGColor;
    [button addTarget:self action:@selector(allButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_allView addSubview:button];
    
    
    _view = [[UIAlertView alloc] initWithTitle:@"清空画板吗" message:@"你真的确定✅？？？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
}
- (void)allButtonAction:(UIButton *)sender
{
    [_view show];
    
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        self.removeAllBlock();
    }
}



- (void)_creatUnDoView
{
    _undoView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_buttonView.frame), self.frame.size.width, 60)];
    _undoView.backgroundColor = [UIColor clearColor];
    [self addSubview:_undoView];
    _undoView.hidden = YES;
    
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    _button.frame = CGRectMake(30, 0, 70, 40);
    [_button setTitle:@"上一次" forState:UIControlStateNormal];
    _button.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    _button.backgroundColor = [UIColor lightGrayColor];
    [_button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [_button addTarget:self action:@selector(lastButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_undoView addSubview:_button];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.frame = CGRectMake(375 - 100, 0, 70, 40);
    [button1 setTitle:@"下一次" forState:UIControlStateNormal];
    button1.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    button1.backgroundColor = [UIColor lightGrayColor];
    [button1 addTarget:self action:@selector(nextButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [button1 setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [_undoView addSubview:button1];
}
- (void)lastButtonAction:(UIButton *)sender
{
    if (self.undoblock) {
        self.undoblock();
    }
}
- (void)nextButtonAction:(UIButton *)sender
{
    self.doNextBlock();
}


//橡皮擦视图
- (void)_creatClearView
{
    _clearView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_buttonView.frame), self.frame.size.width, 60)];
    _clearView.backgroundColor = [UIColor clearColor];
    [self addSubview:_clearView];
    _clearView.hidden = YES;
    
    Mylabel *label1 = [[Mylabel alloc] initWithFrame:CGRectMake(30, 0, 50, 50) Str:@"橡"];
    Mylabel *label2 = [[Mylabel alloc] initWithFrame:CGRectMake(self.center.x - 25, 0, 50, 50) Str:@"皮"];
    Mylabel *label3 = [[Mylabel alloc] initWithFrame:CGRectMake(375 - 30 - 50, 0, 50, 50) Str:@"擦"];
    
    [_clearView addSubview:label1];
    [_clearView addSubview:label2];
    [_clearView addSubview:label3];
    
    
    
}



//画笔粗细视图
- (void)_createLinesView
{
    _lineView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_buttonView.frame), 375, 60)];
    _lineView.backgroundColor = [UIColor clearColor];
    _lineView.hidden = YES;
    [self addSubview:_lineView];
    
    //将画笔粗细的尺寸存入数组
    _lineWidth = @[@1.0,@3.0,@5.0,@7.0,@9.0,@15.0,@20.0];
    CGFloat width = self.bounds.size.width / _lineWidth.count;
    
    //创建按钮
    for (int i = 0; i < _lineWidth.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        NSString *title = [NSString stringWithFormat:@"%@点",_lineWidth[i]];
        [button setTitle:title forState:UIControlStateNormal];
        button.frame = CGRectMake(i * width , 5, width, 50);
        //button.backgroundColor =  [UIColor lightGrayColor];
        button.tag = 200 + i;
        [button addTarget:self action:@selector(linesButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [_lineView addSubview:button];
        
        if (i == 2) {
            button.layer.borderWidth = 4;
            button.layer.borderColor = [UIColor whiteColor].CGColor;
            _lineButton = button;
            button.selected = YES;
        }
    }
    
}
//画笔粗细按钮点击事件
- (void)linesButtonAction:(UIButton *)sender
{
    if (self.lineWidthblock) {
        self.lineWidthblock([_lineWidth[sender.tag - 200] floatValue]);
    }
    
    sender.selected = YES;
    if (sender.selected) {
        sender.layer.borderWidth = 4;
        sender.layer.borderColor = [UIColor whiteColor].CGColor;
    }
    if (_lineButton != sender) {
        _lineButton.layer.borderWidth = 0;
        _lineButton.selected = NO;
    }
    _lineButton = sender;
    
    //[[NSNotificationCenter defaultCenter] postNotificationName:@"changline" object:self];
}

#pragma mark - 颜色视图
//创建颜色板按钮的底部视图
- (void)_creatColorView
{
    _colorView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_buttonView.frame), 375, 60)];
    _colorView.backgroundColor = [UIColor clearColor];
    [self addSubview:_colorView];
    
    //将颜色存入数组
    NSArray *color = @[[UIColor blackColor],
                       [UIColor redColor],
                       [UIColor greenColor],
                       [UIColor blueColor],
                       [UIColor yellowColor],
                       [UIColor orangeColor],
                       [UIColor purpleColor],
                       [UIColor brownColor],
                       [UIColor darkGrayColor],
                       ];
    CGFloat width = self.bounds.size.width / color.count;
    
    //创建颜色按钮
    for (int i = 0; i < color.count; i++) {
        UIControl *colorV = [[UIControl alloc] initWithFrame:CGRectMake(i * width + 2.5, 5, width - 5, 50)];
        colorV.backgroundColor = color[i];
        [colorV addTarget:self action:@selector(colorButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [_colorView addSubview:colorV];
        
        //设置第一个按钮的状态
        if (i == 0) {
            colorV.layer.borderWidth = 4;
            colorV.layer.borderColor = [UIColor whiteColor].CGColor;
            _colorControl = colorV;
            colorV.selected = YES;
        }
    }
    
}
//颜色按钮点击事件
- (void)colorButtonAction:(UIButton *)sender
{
    if (self.selectColor) {
        //调用block
        _selectColor(sender.backgroundColor);
    }
    
    UIControl *cro = (UIControl *)sender;
    cro.selected = YES;
    
    if (cro.selected) {
        cro.layer.borderWidth = 4;
        cro.layer.borderColor = [UIColor whiteColor].CGColor;
        
    }
    if (_colorControl != cro) {
        _colorControl.layer.borderWidth = 0;
        _colorControl.selected = NO;
    }
    _colorControl = cro;
    //[[NSNotificationCenter defaultCenter] postNotificationName:@"changColor" object:self];
}


#pragma mark - 顶部按钮
//创建顶部按钮底部视图
- (void)_creatButtonView
{
    NSArray *titles = @[@"颜色",
                        @"线宽",
                        @"橡皮擦",
                        @"撤销",
                        @"清屏"];
    _buttonView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, CGRectGetWidth(self.bounds), 40)];
    //_buttonView.backgroundColor = [UIColor yellowColor];
    [self addSubview:_buttonView];
    
    
    //创建按钮
    for (int i = 0; i < titles.count; i++) {
        SelectorButton *button = [[SelectorButton alloc] initWithFrame:CGRectMake(i * (375)/5, 0, 375/5, 30)];
        //设置按钮的tag值
        button.tag = 100 + i;
        
        button.backgroundColor = [UIColor clearColor];
        button.title = titles[i];
        button.font = [UIFont boldSystemFontOfSize:17];
        //button.font = [UIFont systemFontOfSize:15.0];
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [_buttonView addSubview:button];
        
        //设置第一个按钮的状态
        if (i == 0) {
            button.isSelected = YES;
            _selectButton = button;
        }
    }
    
}
//顶部按钮点击事件
- (void)buttonAction:(UIButton *)sender
{
    SelectorButton *button = (SelectorButton *)sender;
    //将当前选中的按钮取消选中
    self.selectButton.isSelected = NO;

    

    button.isSelected = !button.isSelected;
    
    //把self.selected设置为当前的按钮
    _selectButton = button;
    

    switch (sender.tag) {
        case 100:
            _colorView.hidden = NO;
            _lineView.hidden = YES;
            _clearView.hidden = YES;
            _undoView.hidden = YES;
            _allView.hidden = YES;
            self.selectColor(self.colorControl.backgroundColor);
            break;
        case 101:
            _lineView.hidden = NO;
            _colorView.hidden = YES;
            _clearView.hidden =  YES;
            _undoView.hidden = YES;
            _allView.hidden = YES;
            break;
        case 102:
            _lineView.hidden = YES;
            _colorView.hidden = YES;
            _clearView.hidden = NO;
            _undoView.hidden = YES;
            _allView.hidden = YES;
            self.selectColor([UIColor whiteColor]);
            break;
        case 103:
            _lineView.hidden = YES;
            _colorView.hidden = YES;
            _clearView.hidden =  YES;
            _undoView.hidden = NO;
            _allView.hidden = YES;
            break;
        case 104:
            _lineView.hidden = YES;
            _colorView.hidden = YES;
            _clearView.hidden =  YES;
            _undoView.hidden = YES;
            _allView.hidden = NO;
        default:
            break;
    }
}

@end

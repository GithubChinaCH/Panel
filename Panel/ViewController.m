//
//  ViewController.m
//  Panel
//
//  Created by mac on 15/8/18.
//  Copyright (c) 2015年 chenhao. All rights reserved.
//

#import "ViewController.h"
#import "PanelView.h"
#import "ToolView.h"



@interface ViewController ()
{
    ToolView *_toolView;
    PanelView *_panelView;
}

@end

@implementation ViewController

- (void)dealloc
{
    //[[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    PanelView *panelView = [[PanelView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:panelView];
    
    ToolView *toolView = [[ToolView alloc] initWithFrame:CGRectMake(0, 0, 375, 124)];
    toolView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:toolView];
    
    
    
    toolView.selectColor = ^(UIColor *color){
        panelView.useColor = color;
    };
    toolView.lineWidthblock = ^(CGFloat lineWidth)
    {
        panelView.lineWidth = lineWidth;
    };
    
    toolView.undoblock = ^{
        [panelView undo];
    };
    toolView.doNextBlock = ^{
        [panelView nextDo];
    };
    
    toolView.removeAllBlock = ^{
        [panelView removeAll];
    };
    
   // [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changePanelColor) name:@"changColor" object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeLine) name:@"changline" object:nil];
    
}
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return 1;
}

- (void)changePanelColor
{
    _panelView.useColor = _toolView.colorControl.backgroundColor;
}

- (void)changeLine
{
    NSInteger num = _toolView.lineButton.tag;
    NSLog(@"%li",num);
    NSNumber *width = _toolView.lineWidth[num - 200];
    
    _panelView.lineWidth = [width floatValue];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

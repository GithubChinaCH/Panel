//
//  PanelView.m
//  Panel
//
//  Created by mac on 15/8/18.
//  Copyright (c) 2015年 chenhao. All rights reserved.
//

#import "PanelView.h"
#import "PathModel.h"

@interface PanelView ()
{
    NSMutableArray *_saveAry;
    int _i;
}

@property (nonatomic, assign) CGMutablePathRef path;




@end

@implementation PanelView
- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _useColor = [UIColor blackColor];
        _lineWidth = 5.0;
        self.backgroundColor = [UIColor whiteColor];
        _saveAry = [NSMutableArray array];
    }
    return self;
}

//将path 绘制到界面上
- (void)drawRect:(CGRect)rect
{
    for (PathModel *p in _pathAry) {
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        [p.color setStroke];
        CGContextSetLineWidth(ctx, p.lineWidth);
        CGContextSetLineCap(ctx, kCGLineCapRound);
        CGContextAddPath(ctx, p.path);
        
        //NSLog(@"%d",p.num);
        NSLog(@"%p",p.num);
        //char a = *p.num;
        //NSLog(@"%c",a);

//        char x = 'D';
//        NSLog(@"%c",x);
        
        CGContextDrawPath(ctx, kCGPathStroke);
    }
    
    if (self.path != nil) {
        CGContextRef context = UIGraphicsGetCurrentContext();
        //设置颜色
        [self.useColor setStroke];
        //设置线宽
        CGContextSetLineWidth(context, self.lineWidth);

        CGContextSetLineCap(context, kCGLineCapRound);
        //绘制路径
        CGContextAddPath(context, self.path);
        //绘制
        CGContextDrawPath(context, kCGPathStroke);
    }
    else
    {
        [super drawRect:rect];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{

    
    //获取到第一次触摸点
    CGPoint point = [[touches anyObject] locationInView:self];
    //获取到一个路径
    self.path = CGPathCreateMutable();
    //将起始点设置为路径的起始点
    CGPathMoveToPoint(self.path, NULL, point.x, point.y);
    [_saveAry removeAllObjects];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint point = [[touches anyObject] locationInView:self];
    //将新产生的点添加到路径上
    CGPathAddLineToPoint(self.path, NULL, point.x, point.y);
    
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (self.pathAry == nil) {
        self.pathAry = [NSMutableArray array];
    }
    PathModel *pathModel = [[PathModel alloc] init];

    
    pathModel.color = self.useColor;
    pathModel.lineWidth = self.lineWidth;
    pathModel.path = self.path;
 
    char i = 'D';
    char *p = &i;
    NSLog(@"%p",&_i);
    
    pathModel.num = p;
    p = NULL;
    NSLog(@"aa%s  aa%s",pathModel.num ,p);


    [self.pathAry addObject:pathModel];
 
    CGPathRelease(self.path);
    self.path = NULL;
    
}

- (void)undo
{
    if (_pathAry.count != 0) {
        PathModel *pathM = [_pathAry lastObject];
        [_saveAry addObject:pathM];
    }
    
    [_pathAry removeLastObject];
    [self setNeedsDisplay];
}

- (void)nextDo
{
    if (_saveAry.count != 0) {
        PathModel *path = [_saveAry lastObject];
        [_pathAry addObject:path];
    }
    
    
    [_saveAry removeLastObject];
    if (_saveAry.count == 0) {
    }
    [self setNeedsDisplay];
}

- (void)removeAll
{
    [_pathAry removeAllObjects];
    [_saveAry removeAllObjects];
    [self setNeedsDisplay];
}

@end

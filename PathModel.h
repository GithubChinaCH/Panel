//
//  PathModel.h
//  Panel
//
//  Created by mac on 15/8/18.
//  Copyright (c) 2015年 chenhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PathModel : NSObject

// 这个是c语言对象 不能用arc管理    assign  用set方法的时候自己将path的引用计算加1  销毁的时候 引用技术减1；
@property (nonatomic, assign) CGMutablePathRef path;

@property (nonatomic, strong) UIColor *color;
@property (nonatomic, assign) CGFloat lineWidth;
@property (nonatomic, assign) char *num;


@end

//
//  PageButtonView.h
//  LongkinBao
//
//  Created by Winson Cheung on 2016/11/10.
//  Copyright © 2016年 winson cheung. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PageButtonView : UIView

// 正常状态下button的颜色
@property(nonatomic, strong) UIColor *normalButtonColor;

// 选中状态下button的颜色
@property (nonatomic, strong) UIColor *selectedButtonColor;

// 选中状态下动画线条的颜色
@property (nonatomic, strong) UIColor *selectedLineColor;

// 注: 要先设置selectedLineColor 再设置selectedIndex, 不然无法给选中状态下button与线条上色
// 选中的button位置
@property (nonatomic, assign) NSInteger selectedIndex;

// 点击button回调block
@property (nonatomic, copy) void (^buttonTouchedBlock)(NSInteger);

// 初始化方法, 传入frame 与 button title数组
- (id)initWithFrame:(CGRect)frame buttonTitles:(NSArray *)buttonTitles;
@end

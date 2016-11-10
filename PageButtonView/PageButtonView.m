//
//  PageButtonView.m
//  LongkinBao
//
//  Created by Winson Cheung on 2016/11/10.
//  Copyright © 2016年 winson cheung. All rights reserved.
//

#import "PageButtonView.h"


const CGFloat pageButtonFontSize = 14.f;

@interface PageButtonView () {

    NSMutableArray *buttonArray;
}

@property (nonatomic, strong) UIView *selectedLine;

@end

@implementation PageButtonView

- (id)initWithFrame:(CGRect)frame buttonTitles:(NSArray *)buttonTitles {

    self = [super initWithFrame:frame];

    if (self) {
        if (buttonTitles.count != 0) {
            [self p_setupButtons:buttonTitles];
        } else {
            NSLog(@"没有传入创建button的数量");
        }
    }
    return self;
}

#pragma mark - 设置button
- (void)p_setupButtons:(NSArray *)buttonTitles {

    NSArray *titles = buttonTitles;
    buttonArray = [@[] mutableCopy];
    // 根据button标题数组设置 button
    for (NSInteger i = 0; i < titles.count; i++) {
        UIButton *button = ({
            button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0 + self.bounds.size.width/titles.count*i, 0, self.bounds.size.width/titles.count, self.bounds.size.height);
            [button.titleLabel setFont:[UIFont systemFontOfSize:pageButtonFontSize]];
            button.tag = i + 110;
            [button addTarget:self action:@selector(clickedPageButton:) forControlEvents:UIControlEventTouchUpInside];
            [button setTitle:buttonTitles[i] forState:UIControlStateNormal];
            [self addSubview:button];

            button;
        });

        [buttonArray addObject:button];
    }
    // 设置滑动的line
    UIView *line = ({
        line = [[UIView alloc] initWithFrame:CGRectMake(0, self.bounds.size.height - 1, self.bounds.size.width/titles.count, 1.f)];
        [self addSubview:line];

        line;
    });
    self.selectedLine = line;
}

#pragma mark - 利用setter方法设置普通状态下button title的颜色
- (void)setNormalButtonColor:(UIColor*)normalButtonColor {

    if (!_normalButtonColor) {
        _normalButtonColor = normalButtonColor;
        for (UIButton *button in buttonArray) {
            [button setTitleColor:normalButtonColor forState:UIControlStateNormal];
        }
    }
}

#pragma mark - 利用setter方法设置选中状态下 动画线的颜色
- (void)setSelectedLineColor:(UIColor *)selectedLineColor {

    if (!_selectedLineColor) {
        _selectedLineColor = selectedLineColor;
        [_selectedLine setBackgroundColor:selectedLineColor];
    }
}

#pragma mark - 利用setter方法设置选中状态下 button title的颜色
- (void)setSelectedIndex:(NSInteger)selectedIndex {

    for (UIButton *button in buttonArray) {
        [button setTitleColor:self.normalButtonColor forState:UIControlStateNormal];
    }
    UIButton *button = buttonArray[selectedIndex - 1];
    [button setTitleColor:self.selectedButtonColor forState:UIControlStateNormal];

    __weak __typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.25 animations:^{
        CGPoint lineCenter = CGPointMake(button.center.x, weakSelf.selectedLine.center.y);
        weakSelf.selectedLine.center = lineCenter;
    }];
}

#pragma mark - 点击button的方法
- (void)clickedPageButton:(UIButton *)button {


    for (UIButton *button in buttonArray) {
        [button setTitleColor:self.normalButtonColor forState:UIControlStateNormal];
    }
    [button setTitleColor:self.selectedButtonColor forState:UIControlStateNormal];

    __weak __typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.25 animations:^{
        CGPoint lineCenter = CGPointMake(button.center.x, weakSelf.selectedLine.center.y);
        weakSelf.selectedLine.center = lineCenter;
    }];


    if (_buttonTouchedBlock) {
        _buttonTouchedBlock(button.tag - 110);
    }
}
@end

//
//  ViewController.m
//  PageButtonViewDemo
//
//  Created by Winson Cheung on 2016/11/10.
//  Copyright © 2016年 Winson Cheung. All rights reserved.
//

#import "ViewController.h"
#import "PageButtonView.h"
@interface ViewController () {

    NSInteger nextButton;
}

@property(nonatomic, strong) PageButtonView *pbView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    nextButton = 1;

    NSArray *buttonTitles = @[@"标题1", @"标题2", @"标题3", @"标题4"];
    CGFloat screen_width = [[UIScreen mainScreen] bounds].size.width;
    PageButtonView *pageButtonView = ({
        pageButtonView = [[PageButtonView alloc]initWithFrame:CGRectMake(0, 20, screen_width, 40) buttonTitles:buttonTitles];
        pageButtonView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        pageButtonView.normalButtonColor = [UIColor grayColor];
        pageButtonView.selectedButtonColor = [UIColor redColor];
        pageButtonView.selectedLineColor = [UIColor blueColor];
        pageButtonView.selectedIndex = nextButton;
        pageButtonView.buttonTouchedBlock = ^(NSInteger index) {
            NSLog(@"点击了或选中了button%ld", (long)index);

        };
        pageButtonView;
    });
    [self.view addSubview:pageButtonView];
    self.pbView = pageButtonView;

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(100, 300, 80, 30)];
    [btn setTitle:@"下一个" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)next {

    if (nextButton > 3) nextButton = 1;
    else nextButton ++;
    self.pbView.selectedIndex = nextButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

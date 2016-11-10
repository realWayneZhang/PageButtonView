# PageButtonView
 这是一个简易的分页button, 封装的较为简单, 适合新手学习和使用.
 
 ![image](https://github.com/WinsonCheung/PageButtonView/blob/master/PageButtonView.gif)
 
# Install
 将PageButtonView.h 与PageButtonView.m 拖拽到工程中即可.
# Use
like this:
```
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
```

#Others
新手若有疑问 欢迎共同学习, 共同成长~

//
//  ViewController.m
//  ChineseToPinYin
//
//  Created by Zhangsong on 16/5/13.
//  Copyright © 2016年 zhangsong. All rights reserved.
//

#import "ViewController.h"
#import "ChineseToPinyin.h"


@interface ViewController ()
{
    UITextField * _baseTextField;

}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createSubViews];
}

- (void)createSubViews
{
    _baseTextField = [[UITextField alloc] initWithFrame:CGRectMake(40, 100, 100, 30)];
    _baseTextField.borderStyle = UITextBorderStyleRoundedRect;
    _baseTextField.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_baseTextField];
    
    UIButton *transButton = [UIButton buttonWithType:UIButtonTypeCustom];
    transButton.frame = CGRectMake(CGRectGetMaxX(_baseTextField.frame) + 20, CGRectGetMinY(_baseTextField.frame), 60, 30);
    [transButton setTitle:@"点击" forState:UIControlStateNormal];
    [transButton setBackgroundColor:[UIColor orangeColor]];
    [transButton addTarget:self action:@selector(transButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:transButton];
}

- (void)transButtonDidClick:(id)sender
{
    if (_baseTextField.text == nil || [_baseTextField.text isEqualToString:@" "]) {
        NSLog(@"请输入汉字");
        return;
    }
    NSString *pinyinStr = [ChineseToPinyin pinyinFromChineseString:_baseTextField.text withSpace:YES];
    NSLog(@"pinyinStr = %@",pinyinStr);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

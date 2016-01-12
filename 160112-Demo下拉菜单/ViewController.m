//
//  ViewController.m
//  160112-Demo下拉菜单
//
//  Created by 张小冬 on 16/1/12.
//  Copyright © 2016年 dadong. All rights reserved.
//

#import "ViewController.h"
#import "DD_PopView.h"
#import "DD_Button_Left.h"
@interface ViewController ()<DDPopViewDelegate>
/**
 *  弹出的View
 */
@property (nonatomic, weak)DD_PopView *popView  ;
/**
 *  导航栏的navigationItem的titleView
 */
@property (nonatomic, weak)DD_Button_Left *button;
/**
 *  弹出的View里面的数据
 */
@property (nonatomic, strong)NSMutableArray *array ;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    DD_Button_Left *button = [[DD_Button_Left alloc]init];
    self.button = button ;
    [button setTitle:@"测试左边" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"up_arrow"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"bottom_arrow"] forState:UIControlStateHighlighted];
    [button setImage:[UIImage imageNamed:@"bottom_arrow"] forState:UIControlStateSelected];
    button.frame = CGRectMake(0 , 0, 100, 50);
    [button addTarget:self action:@selector(listView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    self.navigationItem.titleView = button ;
}

- (void)listView:(UIButton *)sender
{
    sender.selected = !sender.selected ;
    if (sender.selected) {
        DD_PopView *popView = [[DD_PopView alloc]initWithArray:self.array];
        popView.delegate = self ;
        [self.view addSubview:popView];
        self.popView = popView ;
        //把中心点设置在导航栏正中间的下面， 里面的 +6 为View和导航栏的间距
        popView.center = CGPointMake(self.view.bounds.size.width/2, popView.bounds.size.height/2 + 64 + 6);
    }else{
        [self.popView removeFromSuperview];
    }
}

//懒加载设置数据初值
- (NSMutableArray *)array
{
    if (!_array) {
        _array = [NSMutableArray arrayWithArray:@[@"我的微薄",@"朋友圈",@"附近的人",@"hahahaha"]];
    }
    return _array ;
}

#pragma mark - popView的代理
- (void)popView:(DD_PopView *)popView didHightlightedRow:(UIButton *)sender
{
    //交换数据
    NSString *a = self.array[sender.tag-1000];
    self.array[sender.tag-1000] = self.array[0];
    self.array[0] = a ;
    //改变导航栏内容
    self.button.selected = NO ;
    [self.button setTitle:self.array[0] forState:UIControlStateNormal];
    [popView removeFromSuperview];
}
@end

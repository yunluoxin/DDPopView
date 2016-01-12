//
//  DD_PopView.m
//  160112-Demo下拉菜单
//
//  Created by 张小冬 on 16/1/12.
//  Copyright © 2016年 dadong. All rights reserved.
//

#import "DD_PopView.h"
#define DDLog(...) NSLog(__VA_ARGS__)
#define DDColor(R,G,B,Alpha) [UIColor colorWithRed:(R)/255.0 green:(G)/255.0 blue:(B)/255.0 alpha:(Alpha)]
@interface DD_PopView()
@property (nonatomic, strong)NSArray *array ;
@end
@implementation DD_PopView
- (instancetype)initWithArray:(NSArray *)array
{
    if (self = [super init]) {
        _array = [array mutableCopy] ;
        [self initView];
    }
    return self ;
}

- (void)initView
{
    self.backgroundColor = DDColor(207, 207, 207, 1);
    self.selectedText = self.array[0];
    
    CGFloat itemW = 100 ;
    CGFloat itemH = 44 ;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, itemW, itemH);
    [button setTitle:self.selectedText forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self addSubview:button];
    for (int i = 1; i < self.array.count; i ++) {
        UIView *line = [[UIView alloc]init];
        [self addSubview:line];
        CGFloat lineX = 0 ;
        CGFloat lineY = i * itemH ;
        CGFloat lineW = itemW;
        CGFloat lineH = 1 ;
        line.frame = CGRectMake(lineX, lineY, lineW, lineH);
        line.backgroundColor = [UIColor whiteColor];
        
        CGFloat buttonX = lineX ;
        CGFloat buttonY = lineY + 1 ;
        CGFloat buttonW = lineW ;
        CGFloat buttonH = itemH - lineH ;
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = 1000 + i ;
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        [button setTitle:self.array[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(change:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
    
    self.bounds = CGRectMake(0, 0, itemW, itemH * self.array.count);
}
- (void)change:(UIButton *)sender
{
    self.selectedText = self.array[sender.tag- 1000];
    if ([_delegate respondsToSelector:@selector(popView:didHightlightedRow:)]) {
        [_delegate popView:self didHightlightedRow:sender];
    }
}

@end

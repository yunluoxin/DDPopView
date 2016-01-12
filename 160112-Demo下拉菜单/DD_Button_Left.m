//
//  DD_Button_Left.m
//  160112-Demo下拉菜单
//
//  Created by 张小冬 on 16/1/12.
//  Copyright © 2016年 dadong. All rights reserved.
//

#import "DD_Button_Left.h"
static CGFloat scale = 0.8 ;
@implementation DD_Button_Left
- (instancetype)init
{
    if (self = [super init]) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter ;
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return self ;
}
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat x = 0 ;
    CGFloat y = 0 ;
    CGFloat w = contentRect.size.width * scale ;
    CGFloat h = contentRect.size.height ;
    return CGRectMake(x, y, w, h);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat x = contentRect.size.width * scale ;
    CGFloat y = 0 ;
    CGFloat w = contentRect.size.width - x ;
    CGFloat h = contentRect.size.height ;
    return CGRectMake(x, y, w, h);
}
@end

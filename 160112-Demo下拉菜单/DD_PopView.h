//
//  DD_PopView.h
//  160112-Demo下拉菜单
//
//  Created by 张小冬 on 16/1/12.
//  Copyright © 2016年 dadong. All rights reserved.
//
#import <UIKit/UIKit.h>

@class DD_PopView ;
@protocol DDPopViewDelegate <NSObject>
@required
- (void)popView:(DD_PopView *)popView didHightlightedRow:(UIButton *)button ;
@end


@interface DD_PopView : UIView
/**
 *  当前选中的文本
 */
@property (nonatomic, copy)NSString *selectedText ;

/**
 *  依据传入的数据，获得一个以数据个数构成的，自带大小的View
 *  使用时候只需要设置位置就可以!
 *  @param array 数据
 *
 *  @return View
 */
- (instancetype)initWithArray:(NSArray *)array ;

@property (nonatomic, weak)id<DDPopViewDelegate> delegate ;
@end

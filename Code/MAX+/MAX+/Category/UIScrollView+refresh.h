//
//  UIScrollView+refresh.h
//  MAX+
//
//  Created by tarena on 16/8/9.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (refresh)

- (void)addHeaderRefresh:(void(^)())block;

- (void)addFooterRefresh:(void(^)())block;

- (void)beginHeader;

- (void)endHeader;

- (void)endFooder;

@end

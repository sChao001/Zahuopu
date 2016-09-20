//
//  UIScrollView+refresh.m
//  MAX+
//
//  Created by tarena on 16/8/9.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "UIScrollView+refresh.h"

@implementation UIScrollView (refresh)

- (void)addHeaderRefresh:(void(^)())block{
    self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:block];
}

- (void)addFooterRefresh:(void(^)())block{
    self.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:block];
}

- (void)beginHeader{
    [self.mj_header beginRefreshing];
}

- (void)endHeader{
    [self.mj_header endRefreshing];
}

- (void)endFooder{
    [self.mj_footer endRefreshing];
}

@end

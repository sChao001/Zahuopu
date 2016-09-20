//
//  head_view.m
//  MAX+
//
//  Created by tarena on 16/9/3.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "head_view.h"

@implementation head_view


-(UIImageView *)imgV{
    if (!_imgV) {
        _imgV = [self viewWithTag:100];
    }
    return _imgV;
}












/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

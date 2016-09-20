//
//  scrollCell.m
//  MAX+
//
//  Created by tarena on 16/8/27.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "scrollCell.h"

@implementation scrollCell













- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
    }
    return _titleLb;
}

- (iCarousel *)ic {
    if(_ic == nil) {
        _ic = [[iCarousel alloc] init];
    }
    return _ic;
}





- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

//
//  VideoCell.m
//  MAX+
//
//  Created by tarena on 16/9/8.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "VideoCell.h"

@implementation VideoCell





- (UIView *)maskV {
    if(_maskV == nil) {
        _maskV = [[UIView alloc] init];
        [self.contentView addSubview:_maskV];
        [_maskV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.equalTo(0);
            make.height.equalTo(50);
        }];
    }
    return _maskV;
}

- (UIImageView *)bigpic {
    if(_bigpic == nil) {
        _bigpic = [[UIImageView alloc] init];
        [self.contentView addSubview:_bigpic];
        _bigpic.contentMode = UIViewContentModeScaleAspectFill;
        _bigpic.clipsToBounds = YES;
        [_bigpic mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.equalTo(0);
            make.height.equalTo(self.bigpic.mas_width);
            make.top.equalTo(self.maskV.mas_bottom);
        }];
    }
    return _bigpic;
}

- (UIImageView *)smallpic {
    if(_smallpic == nil) {
        _smallpic = [[UIImageView alloc] init];
        UIView *v = [[UIView alloc] init];
        [self.maskV addSubview:v];
        v.backgroundColor = [UIColor colorWithRed:234/255.0 green:49/255.0 blue:130/255.0 alpha:1];
        [v mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(9);
            make.size.equalTo(CGSizeMake(42, 42));
            make.centerY.equalTo(0);
        }];
        v.layer.cornerRadius = 21;
        v.layer.masksToBounds = YES;
        
        [v addSubview:_smallpic];
        _smallpic.contentMode = UIViewContentModeScaleAspectFill;
        _smallpic.layer.cornerRadius = 20;
        _smallpic.clipsToBounds = YES;
        [_smallpic mas_makeConstraints:^(MASConstraintMaker *make) {
            //make.left.equalTo(10);
            make.size.equalTo(CGSizeMake(40, 40));
            make.center.equalTo(0);
        }];
        
        
    }
    return _smallpic;
}

- (UILabel *)myname {
    if(_myname == nil) {
        _myname = [[UILabel alloc] init];
        _myname.font = [UIFont systemFontOfSize:15];
        [self.maskV addSubview:_myname];
        [_myname mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(8);
            make.left.equalTo(self.smallpic.mas_right).equalTo(10);
        }];
    }
    return _myname;
}

- (UILabel *)gps {
    if(_gps == nil) {
        _gps = [[UILabel alloc] init];
        [self.maskV addSubview:_gps];
        _gps.font = [UIFont systemFontOfSize:14];
        _gps.textColor = [UIColor colorWithRed:183/255.0 green:183/255.0 blue:183/255.0 alpha:1];
        [_gps mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.smallpic.mas_right).equalTo(10);
            make.bottom.equalTo(-8);
        }];
    }
    return _gps;
}

- (UILabel *)allnum {
    if(_allnum == nil) {
        _allnum = [[UILabel alloc] init];
        [self.maskV addSubview:_allnum];
        _allnum.font = [UIFont systemFontOfSize:14];
        _allnum.textColor = [UIColor colorWithRed:183/255.0 green:183/255.0 blue:183/255.0 alpha:1];
        [_allnum mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-10);
            make.centerY.equalTo(0);
        }];
    }
    return _allnum;
}




- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

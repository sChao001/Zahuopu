//
//  ImageCell.m
//  MAX+
//
//  Created by tarena on 16/8/9.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "ImageCell.h"

@implementation ImageCell







- (UIView *)grayV {
    if(_grayV == nil) {
        _grayV = [[UIView alloc] init];
        [self.contentView addSubview:_grayV];
        _grayV.backgroundColor = krgb(0, 0, 0, .4);
        [_grayV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.equalTo(0);
            make.height.equalTo(5);
        }];
    }
    return _grayV;
}

- (UIView *)maskV {
    if(_maskV == nil) {
        _maskV = [[UIView alloc] init];
        [self.contentView addSubview:_maskV];
        [_maskV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(0);
            make.top.equalTo(self.grayV.mas_bottom);
            make.height.equalTo(50);
        }];
    }
    return _maskV;
}

- (UIButton *)shareBtn {
    if(_shareBtn == nil) {
        _shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.maskV addSubview:_shareBtn];
        [_shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.right.equalTo(-10);
            make.size.equalTo(CGSizeMake(30, 30));
        }];
        [_shareBtn setImage:[UIImage imageNamed:@"feedShare"] forState:UIControlStateNormal];
    }
    return _shareBtn;
}

- (UIButton *)specialBtn {
    if(_specialBtn == nil) {
        _specialBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.maskV addSubview:_specialBtn];
        [_specialBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.equalTo(0);
            make.right.equalTo(self.shareBtn.mas_left).equalTo(-10);
        }];
                       
    }
    return _specialBtn;
}

- (UIImageView *)speImg {
    if(_speImg == nil) {
        _speImg = [[UIImageView alloc] init];
        [self.specialBtn addSubview:_speImg];
        [_speImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.centerY.equalTo(0);
            make.size.equalTo(CGSizeMake(30, 30));
        }];
        _speImg.layer.cornerRadius = 15;
        _speImg.layer.masksToBounds = YES;
    }
    return _speImg;
}

- (UILabel *)speLb {
    if(_speLb == nil) {
        _speLb = [[UILabel alloc] init];
        [self.specialBtn addSubview:_speLb];
        _speLb.font = [UIFont systemFontOfSize:18];
        [_speLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(0);
            make.left.equalTo(10);
            
        }];
    }
    return _speLb;
}






- (UIImageView *)imageV {
    if(_imageV == nil) {
        _imageV = [[UIImageView alloc] init];
        [self.contentView addSubview:_imageV];
        _imageV.backgroundColor = [UIColor redColor];
        _imageV.contentMode = UIViewContentModeScaleToFill;
        _imageV.clipsToBounds = YES;
        [_speImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(0);
            //make.top.equalTo(self.maskV.mas_bottom);
            make.top.equalTo(0);
            //make.height.equalTo(kMainWindowWidth).dividedBy(16/9.0);
            make.height.equalTo(50);
        }];
    }
    return _imageV;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.numberOfLines = 0;
        [self.contentView addSubview:_titleLb];
        _titleLb.font = [UIFont systemFontOfSize:18];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.right.equalTo(-10);
            make.top.equalTo(self.imageV.mas_bottom).equalTo(10);
            make.height.equalTo(50);
        }];
        
    }
    return _titleLb;
}

- (UILabel *)detailLb {
    if(_detailLb == nil) {
        _detailLb = [[UILabel alloc] init];
        _detailLb.numberOfLines = 0;
        _detailLb.font = [UIFont systemFontOfSize:16];
        [self.contentView addSubview:_detailLb];
        [_detailLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.right.equalTo(-10);
            make.top.equalTo(self.titleLb.mas_bottom).equalTo(10);
            
            make.height.equalTo(40);
        }];
    }
    return _detailLb;
}



- (UILabel *)fuwenben {
    if(_fuwenben == nil) {
        _fuwenben = [[UILabel alloc] init];
        [self.contentView addSubview:_fuwenben];
        [_fuwenben mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.bottom.equalTo(-5);
            make.right.equalTo(10);
            //make.top.equalTo(self.detailLb.mas_bottom).equalTo(20);
        }];
        
        
    }
    return _fuwenben;
}









- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

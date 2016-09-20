//
//  NormalCell.m
//  MAX+
//
//  Created by tarena on 16/8/9.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "NormalCell.h"

@implementation NormalCell




- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self titleLb];
        [self grayV];
        [self praise_count];
        [self imageV];
        [self type];
        [self praise];
        [self comment];
        [self comment_count];
        [self publish_time];
    }
    return self;
}








- (UIImageView *)imageV {
    if(_imageV == nil) {
        _imageV = [[UIImageView alloc] init];
        _imageV.contentMode = UIViewContentModeScaleAspectFill;
        _imageV.clipsToBounds = YES;
        [self.contentView addSubview:_imageV];
        [_imageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.grayV.mas_bottom);
            make.right.bottom.equalTo(0);
            CGFloat width = kMainWindowWidth/2;
            make.width.equalTo(width);
            make.height.equalTo(self.imageV.mas_width).dividedBy(1.5);
        }];
    }
    return _imageV;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.numberOfLines = 0;
        [self.contentView addSubview:_titleLb];
        _titleLb.font = [UIFont systemFontOfSize:15];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.top.equalTo(self.grayV.mas_bottom).equalTo(15);
            make.right.equalTo(self.imageV.mas_left).equalTo(-0);
        }];
    }
    return _titleLb;
}

- (UILabel *)type {
    if(_type == nil) {
        _type = [[UILabel alloc] init];
        [self.contentView addSubview:_type];
        _type.font = [UIFont systemFontOfSize:9];
        _type.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.7];
        [_type mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.bottom.equalTo(self.publish_time.mas_top).equalTo(-2);
            
        }];
    }
    return _type;
}

- (UIImageView *)comment {
    if(_comment == nil) {
        _comment = [[UIImageView alloc] init];
        _comment.contentMode = UIViewContentModeScaleAspectFill;
        _comment.clipsToBounds = YES;
        [self.contentView addSubview:_comment];
        [_comment mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.type.mas_right).equalTo(5);
            make.size.equalTo(CGSizeMake(10, 10));
            make.bottom.equalTo(self.publish_time.mas_top).equalTo(-2);
        }];
        _comment.image = [UIImage imageNamed:@"feedComment"];
    }
    return _comment;
}

- (UILabel *)comment_count {
    if(_comment_count == nil) {
        _comment_count = [[UILabel alloc] init];
        [self.contentView addSubview:_comment_count];
        _comment_count.font = [UIFont systemFontOfSize:9];
        _comment_count.textColor = krgb(0, 0, 0, 0.7);
        [_comment_count mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.comment.mas_right).equalTo(5);
            make.width.greaterThanOrEqualTo(10);
            make.bottom.equalTo(self.publish_time.mas_top).equalTo(-2);
        }];
    }
    return _comment_count;
}

- (UIImageView *)praise {
    if(_praise == nil) {
        _praise = [[UIImageView alloc] init];
        [self.contentView addSubview:_praise];
        _praise.contentMode = UIViewContentModeScaleAspectFill;
        _praise.clipsToBounds = YES;
        [_praise mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.comment_count.mas_right).equalTo(5);
            make.size.equalTo(CGSizeMake(10, 10));
            make.bottom.equalTo(self.publish_time.mas_top).equalTo(-2);
        }];
        _praise.image = [UIImage imageNamed:@"feedPraise"];
    }
    return _praise;
}

- (UILabel *)praise_count {
    if(_praise_count == nil) {
        _praise_count = [[UILabel alloc] init];
        _praise_count.font = [UIFont systemFontOfSize:9];
        [self.contentView addSubview:_praise_count];
        _praise_count.textColor = krgb(0, 0, 0, 0.7);
        [_praise_count mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.praise.mas_right).equalTo(5);
            make.bottom.equalTo(self.publish_time.mas_top).equalTo(-2);
        }];
        
    }
    return _praise_count;
}

- (UILabel *)publish_time {
    if(_publish_time == nil) {
        _publish_time = [[UILabel alloc] init];
        _publish_time.font = [UIFont systemFontOfSize:9];
        _publish_time.textColor = krgb(0, 0, 0, 0.7);
        [self.contentView addSubview:_publish_time];
        [_publish_time mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.bottom.equalTo(-10);
        }];
    }
    return _publish_time;
}

- (UIView *)grayV {
    if(_grayV == nil) {
        _grayV = [[UIView alloc] init];
        [self.contentView addSubview:_grayV];
        _grayV.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2];
        [_grayV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.equalTo(0);
            make.height.equalTo(3);
        }];
    }
    return _grayV;
}






- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

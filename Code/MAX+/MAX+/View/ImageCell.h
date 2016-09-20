//
//  ImageCell.h
//  MAX+
//
//  Created by tarena on 16/8/9.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageCell : UITableViewCell

@property (nonatomic) UIView *grayV;
@property (nonatomic) UIView *maskV;
@property (nonatomic) UIButton *shareBtn;
@property (nonatomic) UIButton *specialBtn;
@property (nonatomic) UIImageView *speImg;
@property (nonatomic) UILabel *speLb;


@property (nonatomic) UIImageView *imageV;
@property (nonatomic) UILabel *titleLb;
@property (nonatomic) UILabel *detailLb;


@property (nonatomic) UILabel *fuwenben;

@property (nonatomic) NSString *type;
@property (nonatomic) NSInteger reply;
@property (nonatomic) NSString *time;
@property (nonatomic) NSInteger praise;


@end

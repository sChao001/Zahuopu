//
//  NormalCell.h
//  MAX+
//
//  Created by tarena on 16/8/9.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NormalCell : UITableViewCell
@property (nonatomic) UIImageView *imageV;
@property (nonatomic) UILabel *titleLb;
@property (nonatomic) UILabel *type;

@property (nonatomic) UIImageView *comment;
@property (nonatomic) UILabel *comment_count;

@property (nonatomic) UIImageView *praise;
@property (nonatomic) UILabel *praise_count;

@property (nonatomic) UILabel *publish_time;

@property (nonatomic) UIView *grayV;



@end

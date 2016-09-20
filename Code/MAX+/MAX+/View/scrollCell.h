//
//  scrollCell.h
//  MAX+
//
//  Created by tarena on 16/8/27.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface scrollCell : UITableViewCell<iCarouselDelegate,iCarouselDataSource>

@property (nonatomic) iCarousel *ic;
@property (nonatomic) UILabel *titleLb;



@end

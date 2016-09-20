//
//  headerView.h
//  MAX+
//
//  Created by tarena on 16/8/26.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
@class headerView;
@protocol headerVdelegate <NSObject>

- (void)headerView:(headerView *)view didSelectedAtIndex:(NSInteger)index;

@end
@protocol headerDataSourse <NSObject>

- (NSInteger)numberOfItems:(headerView *) view;

- (NSURL *)headerView:(headerView *)view URLForImgAtIndex:(NSInteger)index;


@end



@interface headerView : UIView<iCarouselDelegate, iCarouselDataSource>

@property (nonatomic) iCarousel *ic;
@property (nonatomic) UIPageControl *pageC;

- (void)reloadData;

@property (nonatomic) NSTimer *timer;

@property (nonatomic) id<headerDataSourse> dataSourse;
@property (nonatomic) id<headerVdelegate> delegate;

@end

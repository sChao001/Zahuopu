//
//  headerView.m
//  MAX+
//
//  Created by tarena on 16/8/26.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "headerView.h"

@implementation headerView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self ic];
        [self pageC];
    }
    return self;
}

-(void)reloadData{
    [self.ic reloadData];
    [_timer invalidate];
    _timer = nil;
    _timer = [NSTimer bk_scheduledTimerWithTimeInterval:2 block:^(NSTimer *timer) {
        [self.ic scrollToItemAtIndex:_ic.currentItemIndex + 1 animated:YES];
    } repeats:YES];
}

-(void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
    self.pageC.currentPage = carousel.currentItemIndex;
}

-(CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    if (option == iCarouselOptionWrap) {
        value = YES;
    }
    return value;
}

-(NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    if ([_dataSourse respondsToSelector:@selector(numberOfItems:)]) {
        self.pageC.numberOfPages = [_dataSourse numberOfItems:self];
        return [_dataSourse numberOfItems:self];
    }
    return 0;
}

-(UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    if (!view) {
        view = [[UIImageView alloc] initWithFrame:carousel.bounds];
        view.contentMode = UIViewContentModeScaleToFill;
        view.clipsToBounds = YES;
    }
    if ([_dataSourse respondsToSelector:@selector(headerView:URLForImgAtIndex:)]) {
        NSURL *url = [_dataSourse headerView:self URLForImgAtIndex:index];
        [((UIImageView *)view) setImageURL:url];
    }
    
    return view;
}

-(void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    if ([_delegate respondsToSelector:@selector(headerView:didSelectedAtIndex:)]) {
        [_delegate headerView:self didSelectedAtIndex:index];
    }
}

-(void)carouselDidScroll:(iCarousel *)carousel{
   // NSLog(@"yi gundong");
}


-(iCarousel *)ic{
    if (!_ic) {
        _ic = [iCarousel new];
        [self addSubview:_ic];
        _ic.delegate = self;
        _ic.dataSource = self;
        _ic.scrollSpeed = 0.1;
        [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
    }
    return _ic;
}

-(UIPageControl *)pageC{
    if (!_pageC) {
        _pageC = [UIPageControl new];
        [self.ic addSubview:_pageC];
        [_pageC mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.bottom.equalTo(0);
        }];
    }
    return _pageC;
}



@end

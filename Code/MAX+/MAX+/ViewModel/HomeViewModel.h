//
//  HomeViewModel.h
//  MAX+
//
//  Created by tarena on 16/8/11.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "QDailyHomeModel.h"
#import "NetManager.h"

@interface HomeViewModel : BaseViewModel

@property (nonatomic) NSString *last;


/*---   normalcell   ---*/
@property (nonatomic, readonly) NSInteger cellNumber;
@property (nonatomic) NSMutableArray<Feeds *> *dataList;

- (NSURL *)imgTypeOfVC;
- (NSAttributedString *)attributedStringAtIndex:(NSInteger)index;
- (NSString *)detailTextAtIndex:(NSInteger)index;

- (NSURL *)imgURLForIndex:(NSInteger)index;
- (NSString *)titleForIndex:(NSInteger)index;
- (NSString *)artistForIndex:(NSInteger)index;
- (NSString *)comment_countForIndex:(NSInteger)index;
- (NSString *)praise_countForIndex:(NSInteger)index;
- (NSString *)publish_timeForIndex:(NSInteger)index;
- (NSInteger)cellTypeForIndex:(NSInteger)index;
- (NSURL *)URLForIndex:(NSInteger)index;


/*----    headView    ----*/
@property (nonatomic) NSMutableArray<Feeds *> *banners;
@property (nonatomic, readonly) NSInteger headVnum;

- (NSURL *)headImgURLAtIndex:(NSInteger)index;

- (NSURL *)headImgWebURLAtIndex:(NSInteger)index;


-(void)getRequestMode:(RequestMode)requestMode withNumber:(NSInteger)num  completionHandler:(void (^)(NSError *error))completionHandler;


@end

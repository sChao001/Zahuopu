//
//  VideoVideoModel.h
//  MAX+
//
//  Created by tarena on 16/9/8.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "VideoModel.h"

@interface VideoVideoModel : BaseViewModel



- (NSString *)allnumOfItemAtIndex:(NSInteger)index;
- (NSURL *)smallpicOfItemAtIndex:(NSInteger)index;
- (NSURL *)bigpicOfItemAtIndex:(NSInteger)index;
- (NSString *)mynameOfItemAtIndex:(NSInteger)index;
- (NSString *)flvOfItemAtIndex:(NSInteger)index;
- (NSString *)gpsOfItemAtIndex:(NSInteger)index;



@property (nonatomic) NSInteger cellNum;
@property (nonatomic) NSInteger page;
@property (nonatomic) NSMutableArray<VideoDataList *> *datalist;




@end

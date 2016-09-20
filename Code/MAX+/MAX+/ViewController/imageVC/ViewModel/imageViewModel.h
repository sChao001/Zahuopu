//
//  imageViewModel.h
//  MAX+
//
//  Created by tarena on 16/9/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "imageModel.h"

@interface imageViewModel : BaseViewModel

- (NSString *)titleAtIndex:(NSInteger)index;

- (NSURL *)img1URLAtIndex:(NSInteger)index;
- (NSURL *)img2URLAtIndex:(NSInteger)index;
- (NSURL *)img3URLAtIndex:(NSInteger)index;

- (NSInteger)aidAtIndex:(NSInteger)index;









@property (nonatomic, readonly) NSInteger cellNumber;
@property (nonatomic) NSMutableArray<DataList *> *datalist;

@property (nonatomic) NSInteger page;





@end

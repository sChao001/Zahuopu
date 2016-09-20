//
//  NetManager.h
//  MAX+
//
//  Created by tarena on 16/8/11.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "BaseNetworking.h"
#import "QDailyHomeModel.h"
#import "imageModel.h"
#import "VideoModel.h"

@interface NetManager : BaseNetworking

+ (id)getHomeLastkey:(NSString *)lastkey withNumber:(NSInteger)num completionHandler:(void(^)(QDailyHomeModel *model, NSError *error))completionHandler;


+ (id)getImageLastKey:(NSInteger)lastkey completionHandler:(void(^)(imageModel *model, NSError *error))completionHandler;

+ (id)getVideoLastKey:(NSInteger)lastkey completionHandler:(void(^)(VideoModel *model, NSError *error))completionHandler;










@end

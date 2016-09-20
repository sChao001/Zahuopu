//
//  VideoModel.h
//  MAX+
//
//  Created by tarena on 16/9/8.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class VideoData, VideoDataList;
@interface VideoModel : NSObject

@property (nonatomic) VideoData *data;

@end

@interface VideoData : NSObject

@property (nonatomic) NSArray<VideoDataList *> *list;

@end

@interface VideoDataList : NSObject

@property (nonatomic) NSInteger allnum;

@property (nonatomic) NSString *smallpic;

@property (nonatomic) NSString *bigpic;

@property (nonatomic) NSString *myname;

@property (nonatomic) NSString *flv;

@property (nonatomic) NSString *gps;

@end






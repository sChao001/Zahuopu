//
//  VideoModel.m
//  MAX+
//
//  Created by tarena on 16/9/8.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "VideoModel.h"

@implementation VideoModel
kCodingDesc
@end

@implementation VideoData
kCodingDesc
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"list": [VideoDataList class]};
}
@end

@implementation VideoDataList
kCodingDesc
@end
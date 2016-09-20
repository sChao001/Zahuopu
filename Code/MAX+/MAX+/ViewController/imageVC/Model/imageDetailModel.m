//
//  imageDetailModel.m
//  MAX+
//
//  Created by tarena on 16/9/6.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "imageDetailModel.h"

@implementation imageDetailModel

+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{
            @"content" : [Content class]
             };
}

@end

@implementation Content

+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{
             @"width":@"info.width", @"height":@"info.height"
             };
}

@end
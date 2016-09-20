//
//  QDailyHomeModel.m
//  MAX+
//
//  Created by tarena on 16/8/9.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "QDailyHomeModel.h"

@implementation QDailyHomeModel
kCodingDesc
@end
@implementation Meta
kCodingDesc
@end


@implementation Response
kCodingDesc
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{
             @"banners":[Feeds class],
             @"feeds":[Feeds class],
             @"post":[Post class],
             
             @"columns":[Columns class]
             };
}





@end


@implementation Headline
kCodingDesc
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{
             @"list":[List class]
             };
}
@end


@implementation Post
kCodingDesc
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{
             @"ident":@"id",
             @"desc":@"description"
             };
}

+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{
             @"column":[Columns class]
             };
}

@end


@implementation Categ
kCodingDesc
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{
             @"ident":@"id",
             };
}
@end


@implementation Columns
kCodingDesc
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{
             @"ident":@"id",
             @"desc":@"description"
             };
}
@end


@implementation Share
kCodingDesc
@end


@implementation List
kCodingDesc
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{
             @"desc":@"description"
             };
}

@end




@implementation Feeds
kCodingDesc
@end






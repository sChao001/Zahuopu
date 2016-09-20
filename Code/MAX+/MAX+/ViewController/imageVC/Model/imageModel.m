//
//  imageModel.m
//  MAX+
//
//  Created by tarena on 16/9/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "imageModel.h"

@implementation imageModel
kCodingDesc
@end

@implementation Data
kCodingDesc
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"list":[DataList class]};
}
@end

@implementation DataList
kCodingDesc
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"showitem": [Showitem class]};
}
@end

@implementation Showitem
kCodingDesc
@end
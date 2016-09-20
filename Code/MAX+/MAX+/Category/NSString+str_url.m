//
//  NSString+str_url.m
//  MAX+
//
//  Created by tarena on 16/8/9.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "NSString+str_url.h"

@implementation NSString (str_url)

-(NSURL *)my_url{
    return [NSURL URLWithString:self];
}

@end

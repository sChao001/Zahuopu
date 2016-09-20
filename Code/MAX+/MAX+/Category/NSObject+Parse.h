//
//  NSObject+Parse.h
//  MAX+
//
//  Created by tarena on 16/8/9.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kCodingDesc \
-(void)encodeWithCoder:(NSCoder *)aCoder{\
[self modelEncodeWithCoder:aCoder];\
}\
-(instancetype)initWithCoder:(NSCoder *)aDecoder{\
self = [super init];\
return [self modelInitWithCoder:aDecoder];\
}\
-(NSString *)description{\
return [self modelDescription];\
}

@interface NSObject (Parse)<YYModel>

+ (id)parse:(id)JSON;

@end

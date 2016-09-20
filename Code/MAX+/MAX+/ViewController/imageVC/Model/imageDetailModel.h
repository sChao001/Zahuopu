//
//  imageDetailModel.h
//  MAX+
//
//  Created by tarena on 16/9/6.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Content;
@interface imageDetailModel : NSObject
@property (nonatomic) NSArray<Content *> *content;
@end
@interface Content : NSObject
@property (nonatomic) NSString *pic;
@property (nonatomic) NSInteger width;
@property (nonatomic) NSInteger height;
@end
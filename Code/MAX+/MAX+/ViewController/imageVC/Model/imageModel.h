//
//  imageModel.h
//  MAX+
//
//  Created by tarena on 16/9/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Data, DataList, Showitem;


@interface imageModel : NSObject
@property (nonatomic) Data *data;
@end

@interface Data : NSObject
@property (nonatomic) NSArray<DataList *> *list;
@end

@interface DataList : NSObject

@property (nonatomic) NSInteger aid;
@property (nonatomic) NSString *title;
@property (nonatomic) NSArray<Showitem *> *showitem;
@end

@interface Showitem : NSObject
@property (nonatomic) NSString *pic;
@end



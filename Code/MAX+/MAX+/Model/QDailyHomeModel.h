//
//  QDailyHomeModel.h
//  MAX+
//
//  Created by tarena on 16/8/9.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Meta,Response,Headline,Post,Categ,Columns,Share,List,Feeds;
@interface QDailyHomeModel : NSObject

@property (nonatomic, strong) Meta *meta;

@property (nonatomic, strong) Response *response;

@end
@interface Meta : NSObject

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *msg;

@end

@interface Response : NSObject

@property (nonatomic, copy) NSString *last_key;

@property (nonatomic, strong) NSArray<Feeds *> *banners;

@property (nonatomic, strong) Headline *headline;

@property (nonatomic, strong) NSArray<Columns *> *columns;

@property (nonatomic, strong) NSArray<Feeds *> *feeds;

@property (nonatomic, strong) NSArray *banners_ad;

@property (nonatomic, strong) NSArray *feeds_ad;

@property (nonatomic, assign) BOOL has_more;

@end

@interface Headline : NSObject

@property (nonatomic, strong) Post *post;

@property (nonatomic, strong) NSArray<List *> *list;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, assign) NSInteger headline_genre;

@end

@interface Post : NSObject
//-------------------------id
@property (nonatomic, assign) NSInteger ident;
//-------------------------description
@property (nonatomic, copy) NSString *desc;

@property (nonatomic, assign) NSInteger comment_count;

@property (nonatomic, assign) NSInteger page_style;

@property (nonatomic, copy) NSString *film_length;

@property (nonatomic, strong) Categ *category;

@property (nonatomic, copy) NSString *appview;

@property (nonatomic, strong) Columns *column;

@property (nonatomic, assign) NSInteger start_time;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, copy) NSString *super_tag;

@property (nonatomic, assign) NSInteger post_id;

@property (nonatomic, assign) NSInteger publish_time;

@property (nonatomic, copy) NSString *datatype;

@property (nonatomic, assign) NSInteger genre;

@property (nonatomic, assign) NSInteger praise_count;

@end

@interface Categ : NSObject

@property (nonatomic, copy) NSString *image_lab;
//------------------------id
@property (nonatomic, assign) NSInteger ident;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *normal;

@property (nonatomic, copy) NSString *image_experiment;

@property (nonatomic, copy) NSString *normal_hl;

@end

@interface Columns : NSObject

//-------------------------id
@property (nonatomic, assign) NSInteger ident;
//-------------------------description
@property (nonatomic, copy) NSString *desc;

@property (nonatomic, assign) NSInteger post_count;

@property (nonatomic, copy) NSString *content_provider;

@property (nonatomic, copy) NSString *column_tag;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, copy) NSString *sort_time;

@property (nonatomic, copy) NSString *image_large;

@property (nonatomic, strong) Share *share;

@property (nonatomic, assign) BOOL subscribe_status;

@property (nonatomic, assign) NSInteger subscriber_num;

@property (nonatomic, assign) NSInteger show_type;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger genre;

@end

@interface Share : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, copy) NSString *text;

@end

@interface List : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray *keywords;

//-------------------------description
@property (nonatomic, copy) NSString *desc;


@end




@interface Feeds : NSObject

@property (nonatomic, copy) NSString *image;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, strong) Post *post;

@end






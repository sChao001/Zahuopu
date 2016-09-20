//
//  layerView.h
//  MAX+
//
//  Created by tarena on 16/9/13.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface layerView : UIView
@property (nonatomic) NSMutableArray *datalist;

@property (weak, nonatomic) IBOutlet UIImageView *headV;

@property (weak, nonatomic) IBOutlet UILabel *allnumber;

@property (weak, nonatomic) IBOutlet UILabel *timenow;

- (void)reloaddata;



@end

//
//  layerView.m
//  MAX+
//
//  Created by tarena on 16/9/13.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "layerView.h"
#import "chatCell.h"


#import <ShareSDK/ShareSDK.h>
#import <ShareSDKUI/ShareSDK+SSUI.h>


@interface layerView ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIButton *applauseBtn;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UIButton *chatbtn;

@property (weak, nonatomic) IBOutlet UIButton *messagebtn;

@property (weak, nonatomic) IBOutlet UIButton *giftbtn;

@property (weak, nonatomic) IBOutlet UIButton *sharebtn;

@property (weak, nonatomic) IBOutlet UITextField *textfield;

@property (weak, nonatomic) IBOutlet UIButton *sendbtn;

@property (weak, nonatomic) IBOutlet UIImageView *headerview;

@property (weak, nonatomic) IBOutlet UILabel *idd;

@property (weak, nonatomic) IBOutlet UILabel *datelb;



@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableViewConstraints;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomViewconstraints;

@property (nonatomic) BOOL onlydanmu;

@property (nonatomic) NSTimer *timer;

@property (weak, nonatomic) IBOutlet UIButton *btn_friend;

@property (weak, nonatomic) IBOutlet UIButton *btn_weiguanzhu;

@property (weak, nonatomic) IBOutlet UILabel *imglabel;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *msgBottomConstraints;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *viewLeftConstraints;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *shareViewbottomConstraints;




@end


@implementation layerView

- (IBAction)shareClicked:(UIControl *)sender {
    NSLog(@" Share button clicked tag = %ld", (long)sender.tag);
    // 点击分享按钮
}


- (IBAction)btn_friendClicked:(UIButton *)sender {
    self.btn_weiguanzhu.enabled = YES;
    sender.enabled = NO;
    
    [UIView animateWithDuration:0.4 animations:^{
        
        self.viewLeftConstraints.constant = 80;
        [self layoutIfNeeded];
    }];
    
    self.imglabel.text = @"还没有好友和你说话，找他们聊聊吧";
}

- (IBAction)btn_weiguanzhuClicked:(UIButton *)sender {
    self.btn_friend.enabled = YES;
    sender.enabled = NO;
    [UIView animateWithDuration:0.4 animations:^{
        
        self.viewLeftConstraints.constant = kMainWindowWidth - 80 -40;
        [self layoutIfNeeded];
    }];
    self.imglabel.text = @"还没有人和你说话，找个人聊聊吧";
}

- (IBAction)btn_ignoremsgClicked:(id)sender {
    //NSLog(@" yi qing chu");
    
    
    
}



#pragma bottom button clicked
- (IBAction)chatbtnClicked:(id)sender {
    [self.textfield becomeFirstResponder];
}

- (IBAction)messagebtnClicked:(id)sender {
    [UIView animateWithDuration:0.4 animations:^{
        self.msgBottomConstraints.constant = 0;
        [self layoutIfNeeded];
    }];
    
}

- (IBAction)giftbenClicked:(id)sender {
}

- (IBAction)sharebtnClicked:(id)sender {
    //[UIView animateWithDuration:0.5 animations:^{
//        self.shareViewbottomConstraints.constant = 0;
//        [self layoutIfNeeded];
//    }];
        //1、创建分享参数
        NSArray* imageArray = @[[UIImage imageNamed:@"applause-1"]];
        //            （注意：图片必须要在Xcode左边目录里面，名称必须要传正确，如果要分享网络图片，可以这样传iamge参数 images:@[@"http://mob.com/Assets/images/logo.png?v=20150320"]）
        if (imageArray) {
            
            NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
            //                [shareParams SSDKSetupWeChatParamsByText:(NSString *)@"fenxiang"
            //            title:(NSString *)@"title"
            //            url:(NSURL *)[NSURL URLWithString:@"www.baidu.com"]
            //
            //            image:(id)imageArray
            //
            //
            //
            //            type:(SSDKContentType)SSDKContentTypeAuto
            //                                      forPlatformSubType:(SSDKPlatformType)platformSubType];
            [shareParams SSDKSetupShareParamsByText:@"一起来直播，寻找你我的One Piece！"
                                             images:imageArray
                                                url:[NSURL URLWithString:@"http://www.baidu.com"]
                                              title:@"大直播时代"
                                               type:SSDKContentTypeAuto];
            //2、分享（可以弹出我们的分享菜单和编辑界面）
            [ShareSDK showShareActionSheet:nil //要显示菜单的视图, iPad版中此参数作为弹出菜单的参照视图，只有传这个才可以弹出我们的分享菜单，可以传分享的按钮对象或者自己创建小的view 对象，iPhone可以传nil不会影响
                                     items:nil
                               shareParams:shareParams
                       onShareStateChanged:^(SSDKResponseState state, SSDKPlatformType platformType, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error, BOOL end) {
                           
                           switch (state) {
                               case SSDKResponseStateSuccess:
                               {
                                   
                                   
                                   UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"分享成功"
                                                                                       message:nil
                                                                                      delegate:nil
                                                                             cancelButtonTitle:@"确定"
                                                                             otherButtonTitles:nil];
                                   [alertView show];
                                   break;
                               }
                               case SSDKResponseStateFail:
                               {
                                   UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"分享失败"
                                                                                   message:[NSString stringWithFormat:@"%@",error]
                                                                                  delegate:nil
                                                                         cancelButtonTitle:@"OK"
                                                                         otherButtonTitles:nil, nil];
                                   [alert show];
                                   break;
                               }
                               default:
                                   break;
                           }
                       }
             ];}
        
}

- (IBAction)sendbtnClicked:(id)sender {
}





#pragma tableViewDelegate, tableViewDatasourse
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datalist.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
/*    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
        cell.textLabel.textColor = [UIColor yellowColor];
        cell.detailTextLabel.textColor = [UIColor whiteColor];
        cell.detailTextLabel.font = [UIFont systemFontOfSize:17];
        cell.backgroundColor = [UIColor clearColor];
    }
    
    cell.textLabel.text = @"杂货铺掌柜:";
    
    cell.detailTextLabel.text = self.datalist[indexPath.row];*/
    chatCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
    cell.userInteractionEnabled = NO;
    //cell.labelll.text = [NSString stringWithFormat:@"杂货铺掌柜: %@", self.datalist[indexPath.row]];
    cell.backgroundColor = [UIColor clearColor];
    NSAttributedString *att1 = [[NSAttributedString alloc] initWithString:@"杂货铺掌柜: " attributes:@{NSForegroundColorAttributeName:[UIColor brownColor]}];
    NSAttributedString *att2 = [[NSAttributedString alloc] initWithString:self.datalist[indexPath.row] attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    NSMutableAttributedString *mu = [NSMutableAttributedString new];
    [mu appendAttributedString:att1];
    [mu appendAttributedString:att2];
    cell.labelll.attributedText = mu;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}
-(void)reloaddata{
    [self.tableView reloadData];
    [self.tableView scrollToBottom];
}

- (IBAction)sendmsg:(UIButton *)sender {
    NSString *str = self.textfield.text;
    [self.datalist addObject:str];
    sender.enabled = NO;
    self.textfield.text = nil;
    [self.tableView reloadData];
    //[self.tableView scrollToBottom];
    [self.tableView scrollToRow:self.datalist.count-1 inSection:0 atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    if (!self.onlydanmu) {
        NSLog(@"dala ba ");
    }
    
    
}





- (IBAction)editchange:(UITextField *)sender {
    if (sender.text) {
        self.sendbtn.enabled = YES;
    }
}

- (IBAction)exchangebtn:(id)sender {
    //NSLog(@"exchange");
    self.onlydanmu = !self.onlydanmu;
    self.textfield.placeholder = self.onlydanmu ? @"和大家说点什么" : @"开启大喇叭,1钻石/条";
}


- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
        
    }
    return self;
}

- (void)keyboardWillChangeFrame:(NSNotification *)noti{
    //NSLog(@"%@", noti);
    UIViewAnimationOptions options = [noti.userInfo[UIKeyboardAnimationCurveUserInfoKey] integerValue];
    NSTimeInterval duration = [noti.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    //NSLog(@"duration:%lf", duration);
    CGFloat endY = [noti.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].origin.y;
    
    [UIView animateWithDuration:duration delay:0 options:options animations:^{
        self.bottomViewconstraints.constant = kMainWindowHeight - endY;
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        
    }];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.textfield resignFirstResponder];
    [self endEditing:YES];
    [UIView animateWithDuration:0.25 animations:^{
        self.bottomViewconstraints.constant = -48;
        [self layoutIfNeeded];
    }];
    
/*timestamp: 7060.03 touches: {(
                              <UITouch: 0x7fa0e589e5e0> phase: Began tap count: 1 window: <UIWindow: 0x7fa0e3549f10; frame = (0 0; 414 736); gestureRecognizers = <NSArray: 0x7fa0e354bcf0>; layer = <UIWindowLayer: 0x7fa0e3546e80>> view: <layerView: 0x7fa0e5c06ed0; frame = (414 0; 414 736); autoresize = W+H; layer = <CALayer: 0x7fa0e5c07380>> location in window: {295.66665649414062, 216.33332824707031} previous location in window: {295.66665649414062, 216.33332824707031} location in view: {295.66665649414062, 216.33332824707031} previous location in view: {295.66665649414062, 216.33332824707031}*/
    
    
    
//    NSLog(@"%@", event);
//    NSLog(@"%@", event.allTouches);
    //__block NSInteger a = 0;
    [event.allTouches enumerateObjectsUsingBlock:^(UITouch * _Nonnull obj, BOOL * _Nonnull stop) {
        CGPoint p = [obj previousLocationInView:self];
        //NSLog(@"%f", p.y);
        if ((self.msgBottomConstraints.constant == 0) && (p.y < (kMainWindowHeight - 220))) {
            
                [UIView animateWithDuration:0.3 animations:^{
                    
                    self.msgBottomConstraints.constant = -220;
                    [self layoutIfNeeded];
                }];
            //a++;
            //NSLog(@"%ld", (long)a);
        }
    }];
    
    if (self.shareViewbottomConstraints.constant == 0) {
        [UIView animateWithDuration:0.3 animations:^{
        self.shareViewbottomConstraints.constant = -220;
        [self layoutIfNeeded];
    }];
    }
    
    
    
}



- (void)awakeFromNib{
    [super awakeFromNib];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.2 block:^(NSTimer * _Nonnull timer) {
        [self showTheApplauseInView:self belowView:self.applauseBtn];
    } repeats:YES];
    self.onlydanmu = YES;
    UINib *nib = [UINib nibWithNibName:@"chatCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"cell1"];
    [self setUI];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.tableFooterView = [[UIView alloc] init];
    
}























- (void)dealloc{
    //[self removeObserver:self forKeyPath:UIKeyboardWillChangeFrameNotification];
    
    
}



- (void)setUI {
    //鼓掌按钮
    
    self.applauseBtn.contentMode = UIViewContentModeScaleToFill;
    [self.applauseBtn setImage:[UIImage imageNamed:@"applause"] forState:UIControlStateNormal];
    [self.applauseBtn setImage:[UIImage imageNamed:@"applause"] forState:UIControlStateHighlighted];
    [self.applauseBtn addTarget:self action:@selector(applauseBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.applauseBtn];
    [self insertSubview:self.applauseBtn atIndex:3];
    //鼓掌数
    /*
    self.applauseNumLbl = [[UILabel alloc]init];
    self.applauseNumLbl.textColor = [UIColor whiteColor];
    self.applauseNumLbl.font = [UIFont systemFontOfSize:12];
    self.applauseNumLbl.text = @"0";
    [self.applauseBtn addSubview:self.applauseNumLbl];
    self.applauseNumLbl.textAlignment = NSTextAlignmentCenter;
    self.applauseNumLbl.frame = CGRectMake(6, 43, 50, 12);*/
}
- (void)applauseBtnClick {
    //self.applauseNum++;
    //self.applauseNumLbl.text = [NSString stringWithFormat:@"%zd",self.applauseNum];
    
    [self showTheApplauseInView:self belowView:self.applauseBtn];
    
    
}
//鼓掌动画
- (void)showTheApplauseInView:(UIView *)view belowView:(UIButton *)v{
    NSInteger index = arc4random_uniform(7); //取随机图片
    NSString *image = [NSString stringWithFormat:@"applause_%zd",index];
    UIImageView *applauseView = [[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width-7-50, self.frame.size.height - 120, 38, 38)];//增大y值可隐藏弹出动画
    [view insertSubview:applauseView belowSubview:v];
    applauseView.image = [UIImage imageNamed:image];
    
    CGFloat AnimH = 350; //动画路径高度,
    applauseView.transform = CGAffineTransformMakeScale(0, 0);
    applauseView.alpha = 0;
    
    //弹出动画
    [UIView animateWithDuration:0.2 delay:0.0 usingSpringWithDamping:0.6 initialSpringVelocity:0.8 options:UIViewAnimationOptionCurveEaseOut animations:^{
        applauseView.transform = CGAffineTransformIdentity;
        applauseView.alpha = 0.9;
    } completion:NULL];
    
    //随机偏转角度
    NSInteger i = arc4random_uniform(2);
    NSInteger rotationDirection = 1- (2*i);// -1 OR 1,随机方向
    NSInteger rotationFraction = arc4random_uniform(10); //随机角度
    //图片在上升过程中旋转
    [UIView animateWithDuration:4 animations:^{
        applauseView.transform = CGAffineTransformMakeRotation(rotationDirection * M_PI/(4 + rotationFraction*0.2));
    } completion:NULL];
    
    //动画路径
    UIBezierPath *heartTravelPath = [UIBezierPath bezierPath];
    [heartTravelPath moveToPoint:applauseView.center];
    
    //随机终点
    CGFloat ViewX = applauseView.center.x;
    CGFloat ViewY = applauseView.center.y;
    CGPoint endPoint = CGPointMake(ViewX + rotationDirection*10, ViewY - AnimH);
    
    //随机control点
    NSInteger j = arc4random_uniform(2);
    NSInteger travelDirection = 1- (2*j);//随机方向 -1 OR 1
    
    NSInteger m1 = ViewX + travelDirection*(arc4random_uniform(20) + 50);
    NSInteger n1 = ViewY - 60 + travelDirection*arc4random_uniform(20);
    NSInteger m2 = ViewX - travelDirection*(arc4random_uniform(20) + 50);
    NSInteger n2 = ViewY - 90 + travelDirection*arc4random_uniform(20);
    CGPoint controlPoint1 = CGPointMake(m1, n1);//control根据自己动画想要的效果做灵活的调整
    CGPoint controlPoint2 = CGPointMake(m2, n2);
    //根据贝塞尔曲线添加动画
    [heartTravelPath addCurveToPoint:endPoint controlPoint1:controlPoint1 controlPoint2:controlPoint2];
    
    //关键帧动画,实现整体图片位移
    CAKeyframeAnimation *keyFrameAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyFrameAnimation.path = heartTravelPath.CGPath;
    keyFrameAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    keyFrameAnimation.duration = 3 ;//往上飘动画时长,可控制速度
    [applauseView.layer addAnimation:keyFrameAnimation forKey:@"positionOnPath"];
    
    //消失动画
    [UIView animateWithDuration:3 animations:^{
        applauseView.alpha = 0.0;
    } completion:^(BOOL finished) {
        [applauseView removeFromSuperview];
    }];
}






- (NSMutableArray *)datalist {
    if(_datalist == nil) {
        _datalist = [[NSMutableArray alloc] init];
    }
    return _datalist;
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

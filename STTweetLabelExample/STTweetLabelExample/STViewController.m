//
//  STViewController.m
//  STTweetLabel
//
//  Created by Sebastien Thiebaud on 09/29/13.
//  Copyright (c) 2013 Sebastien Thiebaud. All rights reserved.
//

#import "STViewController.h"
#import "STTweetLabel.h"

@interface STViewController ()

@property (strong) IBOutlet UILabel *displayLabel;

@end

@implementation STViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    STTweetLabel *tweetLabel = [[STTweetLabel alloc] initWithFrame:CGRectMake(10.0, 60.0, 300.0, 160.0)];
//    tweetLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:14.0];
    tweetLabel.font = [UIFont systemFontOfSize:16.0f];
//    [tweetLabel setText:@"Hi. #Hot#  This is a new tool for @you! @赵 Developed by @SebThiebaud for #iPhone #ObjC... and #iOS7 ;-) My GitHub page: Https://t.co/pQXDoiYA"];
//    [tweetLabel setText:@"来自#图虫摄影师#：@老劉很忙 【二零一四年三月 城市边缘（四）】摄影使人快乐，这就够了，给这个城市留点记录，我的目的，其它有点扯。 http://t.cn/8sLxpnF"];
//    [tweetLabel setText:@"来自#http://t.cn/8sLxpnF#@老劉#很忙 它有点扯。 http://t.cn/8sLxpnF"];
    [tweetLabel setText:@"来自#我https://t.cn/8sLxpnF对#@老劉#很忙 它有点扯。 http://t.cn/8sLxpnF"];
    tweetLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:tweetLabel];
    
    CGSize size = [tweetLabel suggestedFrameSizeToFitEntireStringConstraintedToWidth:tweetLabel.frame.size.width];
    CGRect frame = tweetLabel.frame;
    frame.size.height = size.height;
    tweetLabel.frame = frame;
    
    [tweetLabel setDetectionBlock:^(STTweetHotWord hotWord, NSString *string, NSString *protocol, NSRange range) {
        NSArray *hotWords = @[@"Handle", @"Hashtag", @"Link"];
        
        _displayLabel.text = [NSString stringWithFormat:@"%@ [%d,%d]: %@%@", hotWords[hotWord], (int)range.location, (int)range.length, string, (protocol != nil) ? [NSString stringWithFormat:@" *%@*", protocol] : @""];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

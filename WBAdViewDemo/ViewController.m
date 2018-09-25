//
//  ViewController.m
//  WBAdViewDemo
//
//  Created by 吴玉国 on 2018/9/25.
//  Copyright © 2018年 吴玉国. All rights reserved.
//

#import "ViewController.h"
#import "WBAdView.h"
@interface ViewController ()
@property (nonatomic, strong) WBAdView * wbAdView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray <NSDictionary*>* dicArray = @[
                                          @{@"typeOne":@"动态",
                                            @"typeTwo":@"新闻",
                                            @"titleOne":@"动态第一个标题",
                                            @"titleTwo":@"新闻第二个标题",
                                            @"rightImage":@"timg1.jpg"},
                                          @{@"typeOne":@"淘宝",
                                            @"typeTwo":@"京东",
                                            @"titleOne":@"淘宝第一个标题",
                                            @"titleTwo":@"京东第二个标题",
                                            @"rightImage":@"timg2.jpg"},
                                          @{@"typeOne":@"汽车",
                                            @"typeTwo":@"科技",
                                            @"titleOne":@"汽车第一个标题",
                                            @"titleTwo":@"科技第二个标题",
                                            @"rightImage":@"timg3.jpg"}];
    
    self.wbAdView = [[WBAdView alloc]initWithTitles:dicArray];
    
    self.wbAdView.frame = CGRectMake(0,200, [UIScreen mainScreen].bounds.size.width, 100);
    
    self.wbAdView.textAlignment = 0;
    self.wbAdView.isHaveTouchEvent = YES;
    self.wbAdView.color = [UIColor whiteColor];
    self.wbAdView.edgeInsets = UIEdgeInsetsMake(8, 8,8, 10);
    self.wbAdView.backgroundColor = [UIColor blueColor];
    self.wbAdView.labelFont = [UIFont systemFontOfSize:15];
    [self.view addSubview:self.wbAdView];
    [self.wbAdView beginScroll];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

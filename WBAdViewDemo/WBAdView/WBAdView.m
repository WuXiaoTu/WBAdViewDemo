//
//  HRAdView.m
//  AutoAdLabelScroll
//
//  Created by 吴冰 on 16/4/6.
//  Copyright © 2016年 吴冰. All rights reserved.
//

#import "WBAdView.h"

#define ViewWidth   self.bounds.size.width
#define ViewHeight  self.bounds.size.height
#define rightWidth  80
#define rightHeight 80

@interface WBAdView ()


@property (nonatomic, strong) UIView * centerView;
@property (nonatomic, strong) UIImageView *rightImageView;
@property (nonatomic, strong) UILabel *mainLabel;
@property (nonatomic, strong) UILabel *minLabel;
@property (nonatomic, strong) UILabel *typeOneLabel;
@property (nonatomic, strong) UILabel *typeTwoLabel;

@end

@implementation WBAdView
{
    NSUInteger index;
    CGFloat margin;
    BOOL isBegin;
}


- (instancetype)initWithTitles:(NSArray *)titles{
    
    self = [super init];
    
    if (self) {
        
        margin = 70;
        
        self.clipsToBounds = YES;
        self.adTitles = titles;
        self.labelFont = [UIFont systemFontOfSize:16];
        self.color = [UIColor blackColor];
        self.time = 2.0f;
        self.textAlignment = NSTextAlignmentLeft;
        self.isHaveTouchEvent = NO;
        self.edgeInsets = UIEdgeInsetsZero;
        
        self.centerView = [[UIView alloc] init];
        [self addSubview:self.centerView];
        
        index = 0;
        
        if (!_rightImageView) {
            _rightImageView = [UIImageView new];
            _rightImageView.backgroundColor = [UIColor whiteColor];
            _rightImageView.image = [UIImage imageNamed:[titles[0]objectForKey:@"rightImage"]];
            [self.centerView addSubview:_rightImageView];
        }
        
        if (!_mainLabel) {
            _mainLabel = [UILabel new];
            _mainLabel.text = [titles[0]objectForKey:@"titleOne"];
            _mainLabel.font = self.labelFont;
            _mainLabel.textAlignment = self.textAlignment;
            _mainLabel.textColor = self.color;
            _mainLabel.numberOfLines = 0;
            [self.centerView addSubview:_mainLabel];
        }
        if (!_minLabel) {
            _minLabel = [UILabel new];
            _minLabel.text = [titles[0]objectForKey:@"titleTwo"];
            _minLabel.font = self.labelFont;
            _minLabel.textAlignment = self.textAlignment;
            _minLabel.textColor = self.color;
            _minLabel.numberOfLines = 0;
            [self.centerView addSubview:_minLabel];
        }
        
        if (!_typeOneLabel) {
            _typeOneLabel = [UILabel new];
            _typeOneLabel.text = [titles[0]objectForKey:@"typeOne"];
            _typeOneLabel.font = self.labelFont;
            _typeOneLabel.textAlignment = 1;
            _typeOneLabel.textColor = self.color;
            _typeOneLabel.numberOfLines = 0;
            _typeOneLabel.layer.cornerRadius = 3.0;
            _typeOneLabel.layer.borderColor = [UIColor whiteColor].CGColor;
            _typeOneLabel.layer.borderWidth = 1.0;
            [self.centerView addSubview:_typeOneLabel];
        }
        if (!_typeTwoLabel) {
            _typeTwoLabel = [UILabel new];
            _typeTwoLabel.text = [titles[0]objectForKey:@"typeTwo"];
            _typeTwoLabel.font = self.labelFont;
            _typeTwoLabel.textAlignment = 1;
            _typeTwoLabel.textColor = self.color;
            _typeTwoLabel.numberOfLines = 0;
            _typeTwoLabel.layer.cornerRadius = 3.0;
            _typeTwoLabel.layer.borderColor = [UIColor whiteColor].CGColor;
            _typeTwoLabel.layer.borderWidth = 1.0;
            [self.centerView addSubview:_typeTwoLabel];
        }
        
    }
    return self;
}


- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.centerView.frame = self.bounds;
    self.typeOneLabel.frame = CGRectMake(10, 20, 50, 20);
    self.typeTwoLabel.frame = CGRectMake(10, self.typeOneLabel.frame.origin.y + self.typeOneLabel.frame.size.height + 20, 50, 20);
    self.mainLabel.frame = CGRectMake(margin, 20, ViewWidth - margin - rightWidth, 20);
    self.minLabel.frame = CGRectMake(margin, self.mainLabel.frame.origin.y + self.mainLabel.frame.size.height + 20, ViewWidth - margin - rightWidth, 20);
    self.rightImageView.frame = CGRectMake(ViewWidth - (rightWidth + 10), 10, rightWidth, rightHeight);
}


/**
 *  启动滚动
 */
- (void)beginScroll{
    if (index == _adTitles.count) {
        index = 0;
    }
    
    CATransition *animation = [CATransition animation];
    animation.duration = 0.5;
    animation.type = @"cube";
    animation.subtype = kCATransitionFromTop;
    [_centerView.layer addAnimation:animation forKey:@"animation"];
    
    _mainLabel.text = [_adTitles[index]objectForKey:@"titleOne"];
    _minLabel.text  = [_adTitles[index]objectForKey:@"titleTwo"];
    _typeOneLabel.text = [_adTitles[index]objectForKey:@"typeOne"];
    _typeTwoLabel.text = [_adTitles[index]objectForKey:@"typeTwo"];
    _rightImageView.image = [UIImage imageNamed:[_adTitles[index]objectForKey:@"rightImage"]];
    
    index += 1;
    [self performSelector:@selector(beginScroll) withObject:nil afterDelay:_time];
    
}


- (void)setEdgeInsets:(UIEdgeInsets)edgeInsets{
    _edgeInsets = edgeInsets;
}


- (void)setIsHaveTouchEvent:(BOOL)isHaveTouchEvent{
    if (isHaveTouchEvent) {
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickEvent:)];
        [self addGestureRecognizer:tapGestureRecognizer];
    }else{
        self.userInteractionEnabled = NO;
    }
}


- (void)setTextAlignment:(NSTextAlignment)textAlignment{
    _textAlignment = textAlignment;
    
    _mainLabel.textAlignment = _textAlignment;
    _minLabel.textAlignment = _textAlignment;
}

- (void)setColor:(UIColor *)color{
    _color = color;
    _mainLabel.textColor = _color;
    _minLabel.textColor = _color;
    _typeOneLabel.textColor = _color;
    _typeTwoLabel.textColor = _color;
}

- (void)setLabelFont:(UIFont *)labelFont{
    _labelFont = labelFont;
    _mainLabel.font = _labelFont;
    _minLabel.font = _labelFont;
    _typeOneLabel.font = _labelFont;
    _typeTwoLabel.font = _labelFont;
}


- (void)clickEvent:(UITapGestureRecognizer *)tapGestureRecognizer{
    
    if (self.clickAdBlock) {
        self.clickAdBlock(index);
    }
}


@end

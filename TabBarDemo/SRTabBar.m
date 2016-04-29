//
//  SRTabBar.m
//  TabBarDemo
//
//  Created by marksong on 4/29/16.
//  Copyright © 2016 S.R. All rights reserved.
//

#import "SRTabBar.h"

@interface SRTabBar ()

@property (nonatomic, weak) UIButton *plusButton;

@end

@implementation SRTabBar

@synthesize delegate = _delegate;

#pragma mark - Override

- (void)awakeFromNib {
    UIButton *plusButton = [self initializePlusButton];
    [self addSubview:plusButton];
    self.plusButton = plusButton;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.plusButton.center = [self.superview convertPoint:self.center toView:self];
    CGFloat tabBarButtonWidth = CGRectGetWidth(self.frame) / 5;
    NSInteger index = 0;
    
    for (UIView *subView in self.subviews) {
        if (![subView isKindOfClass:NSClassFromString(@"UITabBarButton")]) continue;
        subView.frame = CGRectMake(tabBarButtonWidth * index, CGRectGetMinY(subView.frame), tabBarButtonWidth, CGRectGetHeight(subView.frame));
        index++;
        if (index == 2) index++;
    }
}

#pragma mark - Responder

- (void)plusButtonDidClick {
    if ([self.delegate respondsToSelector:@selector(tabBarDidClickPlusButton:)]) {
        [self.delegate tabBarDidClickPlusButton:self];
    }
}

#pragma mark - Private

- (UIButton *)initializePlusButton {
    UIButton *plusButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [plusButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
    [plusButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
    [plusButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
    [plusButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
    CGSize backgroundImageSize = plusButton.currentBackgroundImage.size;
    plusButton.frame = CGRectMake(0, 0, backgroundImageSize.width, backgroundImageSize.height);
    [plusButton addTarget:self action:@selector(plusButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
    
    return plusButton;
}

@end

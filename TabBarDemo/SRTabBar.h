//
//  SRTabBar.h
//  TabBarDemo
//
//  Created by marksong on 4/29/16.
//  Copyright © 2016 S.R. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SRTabBar;

@protocol SRTabBarDelegate <UITabBarDelegate>

- (void)tabBarDidClickPlusButton:(SRTabBar *)tabBar;

@end

@interface SRTabBar : UITabBar

@property (nonatomic, weak) id<SRTabBarDelegate> delegate;

@end
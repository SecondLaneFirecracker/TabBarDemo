//
//  SRTabBarController.m
//  TabBarDemo
//
//  Created by marksong on 4/29/16.
//  Copyright © 2016 S.R. All rights reserved.
//

#import "SRTabBarController.h"
#import "SRTabBar.h"
#import "RouterViewController.h"

@interface SRTabBarController () <SRTabBarDelegate>

@property (nonatomic) RouterViewController *routerViewController;

@end

@implementation SRTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDictionary *tabBarSelectedAttributeDictionary = @{NSForegroundColorAttributeName:[UIColor orangeColor]};
    UITabBarItem *tabBarItem = [UITabBarItem appearance];
    [tabBarItem setTitleTextAttributes:tabBarSelectedAttributeDictionary forState:UIControlStateSelected];
}

- (void)tabBarDidClickPlusButton:(SRTabBar *)tabBar {
    [self showRouterView];
}

- (void)showRouterView {
    self.routerViewController.view.frame = self.view.bounds;
    [self.view addSubview:self.routerViewController.view];
}

- (RouterViewController *)routerViewController {
    if (!_routerViewController) {
        _routerViewController = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([RouterViewController class])];
    }
    
    return _routerViewController;
}

@end

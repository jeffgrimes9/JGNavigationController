//
//  JGNavigationController.m
//  customnav
//
//  Created by Jeff Grimes on 9/30/12.
//  Copyright (c) 2012 Jeff Grimes. All rights reserved.
//

#import "JGNavigationController.h"

@implementation JGNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (id)initWithRootViewController:(UIViewController *)rootViewController {
    if (self = [super initWithNavigationBarClass:[JGNavigationBar class] toolbarClass:[JGToolbar class]]) {
        [self pushViewController:rootViewController animated:NO];
        [self setToolbarHidden:NO];
    }
    return self;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [super pushViewController:viewController animated:animated];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
    return [super popViewControllerAnimated:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    
    [super dealloc];
}

@end
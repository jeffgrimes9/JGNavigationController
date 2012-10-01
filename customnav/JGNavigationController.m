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
        [self.navigationBar.leftButton addTarget:self action:@selector(popViewControllerAnimated:) forControlEvents:UIControlEventTouchUpInside];
        [self pushViewController:rootViewController animated:NO];
        [self setToolbarHidden:NO];
        self.navigationBar.navigationDelegate = self;
        self.toolbar.navigationDelegate = self;
    }
    return self;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    // hide back button to support custom leftButton
    viewController.navigationItem.hidesBackButton = YES;
    
    [super pushViewController:viewController animated:animated];
    
    if (!self.navigationBar.backItem) {
        self.navigationBar.leftButton.hidden = YES;
    }
}

- (IBAction)leftNavBarButtonTapped:(id)sender {
    [self popViewControllerAnimated:YES];
}

- (IBAction)rightNavBarButtonTapped:(id)sender {
    
}

- (IBAction)leftToolbarButtonTapped:(id)sender {
    
}

- (IBAction)rightToolbarButtonTapped:(id)sender {
    
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
    return [super popViewControllerAnimated:animated];
}

- (void)navBarAddedButtons {
    [self.navigationBar.leftButton addTarget:self action:@selector(leftNavBarButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationBar.rightButton addTarget:self action:@selector(rightNavBarButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)toolbarAddedButtons {
    [self.toolbar.leftButton addTarget:self action:@selector(leftToolbarButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.toolbar.rightButton addTarget:self action:@selector(rightToolbarButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    self.navigationBar = nil;
    self.toolbar = nil;
    [super dealloc];
}

@end
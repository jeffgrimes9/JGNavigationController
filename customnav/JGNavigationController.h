//
//  JGNavigationController.h
//  customnav
//
//  Created by Jeff Grimes on 9/30/12.
//  Copyright (c) 2012 Jeff Grimes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JGNavigationBar.h"
#import "JGToolbar.h"

@interface JGNavigationController : UINavigationController <JGNavigationBarProtocol, JGToolbarProtocol>

@property (nonatomic, retain) JGNavigationBar *navigationBar;
@property (nonatomic, retain) JGToolbar *toolbar;

- (id)initWithRootViewController:(UIViewController *)rootViewController;
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated;
- (UIViewController *)popViewControllerAnimated:(BOOL)animated;

@end
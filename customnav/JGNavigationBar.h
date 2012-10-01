//
//  JGNavigationBar.h
//  customnav
//
//  Created by Jeff Grimes on 9/30/12.
//  Copyright (c) 2012 Jeff Grimes. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JGNavigationBarProtocol <NSObject>
- (void)navBarAddedButtons;
@end

@interface JGNavigationBar : UINavigationBar

@property (nonatomic, assign) id<JGNavigationBarProtocol> navigationDelegate;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) UIButton *leftButton;
@property (nonatomic, retain) UIButton *rightButton;

- (void)setTitle:(NSString *)title;

@end
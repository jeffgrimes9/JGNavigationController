//
//  JGNavigationBar.h
//  customnav
//
//  Created by Jeff Grimes on 9/30/12.
//  Copyright (c) 2012 Jeff Grimes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JGNavigationBar : UINavigationBar

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) UIButton *leftButton;
@property (nonatomic, retain) UIButton *rightButton;

- (void)set222Title:(NSString *)title;

@end
//
//  JGToolbar.h
//  customnav
//
//  Created by Jeff Grimes on 9/30/12.
//  Copyright (c) 2012 Jeff Grimes. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JGToolbarProtocol <NSObject>
- (void)toolbarAddedButtons;
@end

@interface JGToolbar : UIToolbar

@property (nonatomic, assign) id<JGToolbarProtocol> navigationDelegate;
@property (nonatomic, retain) UIButton *leftButton;
@property (nonatomic, retain) UIButton *rightButton;

@end
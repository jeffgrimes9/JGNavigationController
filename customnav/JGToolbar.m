//
//  JGToolbar.m
//  customnav
//
//  Created by Jeff Grimes on 9/30/12.
//  Copyright (c) 2012 Jeff Grimes. All rights reserved.
//

#import "JGToolbar.h"

@interface JGToolbar ()

@property (nonatomic, assign) BOOL buttonsAdded;

@end

const float heightMultiplierToolbar = 1.6; // ratio of JGToolbar's height to regular toolbar height
const float buttonHeightRatio = 0.54; // ratio of button height to toolbar height
const float widthToHeightRatio = 3.74; // ratio of toolbar button's width to height
const float outsidePaddingRatio = 0.08; // ratio of padding outside buttons to toolbar width
const int button1TagToolbar = 1002;
const int button2TagToolbar = 1003;

@implementation JGToolbar

- (void)drawRect:(CGRect)rect {
    UIImage *image = [UIImage imageNamed:@"whitePixel.png"];
    self.frame = CGRectMake(0, self.frame.origin.y-self.frame.size.height*(heightMultiplierToolbar-1), self.frame.size.width, self.frame.size.height*heightMultiplierToolbar);
    [image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    
    if (!self.buttonsAdded) {
        float buttonHeight = self.frame.size.height*buttonHeightRatio;
        float buttonWidth = buttonHeight*widthToHeightRatio;
        float buttonOutsidePadding = self.frame.size.width*outsidePaddingRatio/2;
        float buttonInsidePadding = self.frame.size.width - 2*(buttonWidth + buttonOutsidePadding);
        float buttonVertPadding = (self.frame.size.height - buttonHeight)/2;
        
        // create leftButton and rightButton
        UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
        UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
        button1.frame = CGRectMake(buttonOutsidePadding, buttonVertPadding, buttonWidth, buttonHeight);
        button2.frame = CGRectMake(buttonOutsidePadding + buttonWidth + buttonInsidePadding, buttonVertPadding, buttonWidth, buttonHeight);
        button1.tag = button1TagToolbar;
        button2.tag = button2TagToolbar;
        
        UIImage *button1Image = [UIImage imageNamed:@"button1.png"];
        UIImage *button2Image = [UIImage imageNamed:@"button2.png"];
        [button1 setImage:button1Image forState:UIControlStateNormal];
        [button2 setImage:button2Image forState:UIControlStateNormal];
        [self addSubview:button1];
        [self addSubview:button2];
        self.leftButton = button1;
        self.rightButton = button2;
        self.buttonsAdded = YES;
    }
}

- (void)dealloc {
    self.leftButton = nil;
    self.rightButton = nil;
    [super dealloc];
}

@end
//
//  JGNavigationBar.m
//  customnav
//
//  Created by Jeff Grimes on 9/30/12.
//  Copyright (c) 2012 Jeff Grimes. All rights reserved.
//

#import "JGNavigationBar.h"

@interface JGNavigationBar ()

@property (nonatomic, retain) UILabel *titleLabel;
@property (nonatomic, assign) BOOL buttonsAdded;

@end

const float heightMultiplier = 2; // ratio of JGNavigationBar's height to regular nav bar height
const float titlePaddingRatio = 0.11; // ratio of padding above and below the title to nav bar height
const float leftDividerRatio = 0.225; // percentage of left button/title divider to nav bar width
const float rightDividerRatio = 1 - leftDividerRatio; // percentage of left button/title divider to nav bar width
const float buttonRatio = 0.46; // percentage of the nav bar's height that the square button will occupy
const int button1Tag = 1000;
const int button2Tag = 1001;

@implementation JGNavigationBar

@synthesize title = _title;

- (void)setTitle:(NSString *)title {
    _title = title;
    if (!self.titleLabel) {
        // create titleLabel
        [self drawRect:self.frame];
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width*leftDividerRatio, self.frame.origin.y + self.frame.size.height*titlePaddingRatio, self.frame.size.width*(rightDividerRatio - leftDividerRatio), self.frame.size.height)];
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.titleLabel.font = [UIFont fontWithName:@"Gill Sans" size:30];
        self.titleLabel.textColor = [UIColor blackColor];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.titleLabel];
    }
    self.titleLabel.text = title;
}

- (void)drawRect:(CGRect)rect {
    UIImage *image = [UIImage imageNamed:@"whitePixel.png"];
    self.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height*heightMultiplier);
    [image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    
    if (!self.buttonsAdded) {
        float buttonSide = self.frame.size.height*buttonRatio;
        float buttonHoriPadding = (self.frame.size.width*leftDividerRatio - buttonSide)/2;
        float buttonVertPadding = (self.frame.size.height - buttonSide)/1.4;
        
        // create leftButton and rightButton
        UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
        UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
        button1.frame = CGRectMake(buttonHoriPadding, buttonVertPadding, buttonSide, buttonSide);
        button2.frame = CGRectMake(self.frame.size.width - buttonHoriPadding - buttonSide, buttonVertPadding, buttonSide, buttonSide);
        button1.tag = button1Tag;
        button2.tag = button2Tag;
        
        UIImage *button1Image = [UIImage imageNamed:@"arrowLeft.png"];
        UIImage *button2Image = [UIImage imageNamed:@"arrowRight.png"];
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
    self.title = nil;
    self.leftButton = nil;
    self.rightButton = nil;
    [super dealloc];
}

@end
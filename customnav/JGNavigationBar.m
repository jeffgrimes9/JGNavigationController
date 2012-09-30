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

@end

const float titlePaddingRatio = 0.1; // ratio of padding above and below the title to nav bar height
const float leftDividerRatio = 0.225; // percentage of left button/title divider to nav bar width
const float rightDividerRatio = 1 - leftDividerRatio; // percentage of left button/title divider to nav bar width

@implementation JGNavigationBar

- (void)set222Title:(NSString *)title {
    self.title = title;
    if (!self.titleLabel) {
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
    float heightMultiplier = 2; // ratio of JGNavigationBar's height to regular nav bar height
    self.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height*heightMultiplier);
    [image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
}

- (void)dealloc {
    self.title = nil;
    self.leftButton = nil;
    self.rightButton = nil;
    [super dealloc];
}

@end
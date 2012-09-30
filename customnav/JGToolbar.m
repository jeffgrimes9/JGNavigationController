//
//  JGToolbar.m
//  customnav
//
//  Created by Jeff Grimes on 9/30/12.
//  Copyright (c) 2012 Jeff Grimes. All rights reserved.
//

#import "JGToolbar.h"

@implementation JGToolbar

- (void)drawRect:(CGRect)rect {
    UIImage *image = [UIImage imageNamed:@"whitePixel.png"];
    float heightMultiplier = 1.6; // ratio of JGToolbar's height to regular toolbar height
    self.frame = CGRectMake(0, self.frame.origin.y-self.frame.size.height*(heightMultiplier-1), self.frame.size.width, self.frame.size.height*heightMultiplier);
    [image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
}

- (void)dealloc {
    self.leftButton = nil;
    self.rightButton = nil;
    [super dealloc];
}

@end
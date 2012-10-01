//
//  DemoPages.h
//  customnav
//
//  Created by Jeff Grimes on 9/30/12.
//  Copyright (c) 2012 Jeff Grimes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DemoPages : NSObject

@property (nonatomic, retain) NSMutableArray *pages;
@property (nonatomic, assign) int pagesIndex;

+ (id)sharedInstance;
- (UIViewController *)nextPage;
- (void)pageWasPopped;
- (int)numPages;

@end
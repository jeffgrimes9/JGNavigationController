//
//  DemoPages.m
//  customnav
//
//  Created by Jeff Grimes on 9/30/12.
//  Copyright (c) 2012 Jeff Grimes. All rights reserved.
//

#import "DemoPages.h"

static DemoPages *sharedInstance = nil;

@implementation DemoPages

+ (id)sharedInstance {
    if (sharedInstance == nil) {
        sharedInstance = [[DemoPages alloc] init];
    }
    return sharedInstance;
}

- (id)init {
    if (self = [super init]) {
        NSMutableArray *views = [[NSMutableArray alloc] init];
        for (int i = 0; i < 6; i++) {
            NSString *nibName = [NSString stringWithFormat:@"View%i", i+1];
            UIViewController *vc = [[UIViewController alloc] initWithNibName:nibName bundle:nil];
            [views addObject:vc];
            [vc release];
        }
        self.pages = views;
        [views release];
        self.pagesIndex = -1;
    }
    return self;
}

- (UIViewController *)nextPage {
    self.pagesIndex++;
    return [self.pages objectAtIndex:self.pagesIndex];
}

- (void)pageWasPopped {
    self.pagesIndex--;
}

- (int)numPages {
    return self.pages.count;
}

- (void)dealloc {
    self.pages = nil;
    [super dealloc];
}

@end
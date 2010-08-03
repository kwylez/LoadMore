//
//  loadmoreAppDelegate.m
//  loadmore
//
//  Created by cwiles on 12/2/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "loadmoreAppDelegate.h"
#import "loadmoreViewController.h"

@implementation loadmoreAppDelegate

@synthesize window;
@synthesize viewController;

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end

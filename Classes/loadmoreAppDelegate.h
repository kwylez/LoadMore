//
//  loadmoreAppDelegate.h
//  loadmore
//
//  Created by cwiles on 12/2/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class loadmoreViewController;

@interface loadmoreAppDelegate : NSObject <UIApplicationDelegate> {
  UIWindow *window;
  loadmoreViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet loadmoreViewController *viewController;

@end


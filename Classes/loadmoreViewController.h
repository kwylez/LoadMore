//
//  loadmoreViewController.h
//  loadmore
//
//  Created by cwiles on 12/2/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface loadmoreViewController : UITableViewController {
  NSMutableArray *data;
  UITableViewCell *customCell;
  NSArray *webServiceDataModel;
}

@property (nonatomic, retain) NSMutableArray *data;
@property (nonatomic, retain) IBOutlet UITableViewCell *customCell;
@property (nonatomic, retain) NSArray *webServiceDataModel;

- (void)updateTableRows;

@end


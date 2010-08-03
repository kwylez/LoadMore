//
//  loadmoreViewController.m
//  loadmore
//
//  Created by cwiles on 12/2/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "loadmoreViewController.h"

@implementation loadmoreViewController

@synthesize data;
@synthesize customCell;
@synthesize webServiceDataModel;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
  
  self.data                = [NSArray arrayWithObjects:@"cory", @"erin", @"mckinna", nil];
  self.webServiceDataModel = [NSArray arrayWithObjects:@"mike", @"sharon", @"edwin", @"nathan", @"jamie", nil];

  CGRect currentFrame = self.tableView.frame;
  currentFrame.size.height = ([data count] + 1) * 44;
  self.tableView.frame = currentFrame;
  self.tableView.backgroundColor = [UIColor whiteColor];
  
  [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (void)dealloc {
  [data release];
  [customCell release];
  [webServiceDataModel release];
  [super dealloc];
}

- (void)updateTableRows {

  self.data = [self.data arrayByAddingObjectsFromArray:self.webServiceDataModel];
  
  CGRect currentFrame = self.tableView.frame;
  currentFrame.size.height = ([data count] + 1) * 44;
  self.tableView.frame = currentFrame;
  
  [self.tableView reloadData];
}

#pragma mark -
#pragma mark Table Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	// Return 1 section which will be used to display the giant blank UITableViewCell as defined
	// in the tableView:cellForRowAtIndexPath: method below
	if ([self.data count] == 0){
		
		return 1;
		
	} else if ([self.data count] <= [self.webServiceDataModel count]) {
    
		// Add an object to the end of the array for the "Load more..." table cell.
		return [self.data count] + 1;
    
	}	
	// Return the number of rows as there are in the searchResults array.
	return [self.data count];
	
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

	static NSString *CellIdentifier = @"Cell";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
  if (indexPath.row != [data count]) {
    
    if (cell == nil) {
      cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
      
    }

    cell.textLabel.text = [self.data objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:17.0f];

  } else {
    [[NSBundle mainBundle] loadNibNamed:@"readmorecell" owner:self options:nil];
    cell = self.customCell;
    self.customCell = nil;
  }
  return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  
  [tableView deselectRowAtIndexPath:indexPath animated:YES];

  if (indexPath.row == [self.data count]) {
    [self updateTableRows];
  }
}

@end

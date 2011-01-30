//
//  MainViewController.m
//  SpeedDial
//
//  Created by Moshe Berman on 12/10/10.
//  Copyright 2010 MosheBerman.com. All rights reserved.
//

#import "MainViewController.h"
#import "Constants.h"

@implementation MainViewController
@synthesize numbersTable;

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
}
*/

- (void) viewDidLoad{
	
	//
	//	Load the numbers into an array
	//
	
	NSArray *numbersArray = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:kNumbersFileName ofType:@"plist"]];
	
	//
	//	Create a tableview with the numbers in it
	//
	
	SettingsView *numbers = [[SettingsView alloc] initWithStyle:UITableViewStyleGrouped];
	[numbers setNumbersArray:numbersArray];
	[numbersArray release];
	
	//
	//	Set the frame of the table view
	//
	
	[numbers.view setFrame:CGRectMake(0, kInfoBarHeight, self.view.frame.size.width, self.view.frame.size.height - kInfoBarHeight)];
	
	//
	//	retain the table view as a property of our Main View
	//
	
	self.numbersTable = numbers;
	[numbers release];
	
	//
	//	Add the view to the display hierarchy
	//
	
	[self.view addSubview:numbersTable.view];
	[self.view setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
}


- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller {
	[self dismissModalViewControllerAnimated:YES];
}


- (IBAction)showInfo:(id)sender {    
	
	//
	//	Show the "info" view
	//
	
	FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
	controller.delegate = self;
	controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:controller animated:YES];
	
	[controller release];
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


- (void)dealloc {
	[numbersTable release];
    [super dealloc];
}


@end

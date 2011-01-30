//
//  SettingsView.m
//  Hatzalah
//
//  Created by Moshe Berman on 12/10/10.
//  Copyright 2010 MosheBerman.com. All rights reserved.
//

#import "SettingsView.h"


@implementation SettingsView
@synthesize numbersArray;

#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];

	//
	//	Set the height of the rows in the numbers table
	//
	
	[self.tableView setRowHeight:50];
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //	Return the number of sections.
	//	We want just one
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	//
	//	Return the number of rows in the section.
	//	We want one row for each number
	
	if (section == 0){
		return [self.numbersArray count];
	}else{
		return 0;
	}
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier] autorelease];
    }
    
	//
	//	Load the numbers and names into the array
	//	we don't need these NSStrings, as we could load the information
	//	directly into the textLabel and detailTextLabel, but this is more 
	//	readable code.
	//
	
	NSString *number = [[self.numbersArray objectAtIndex:[indexPath row]] objectAtIndex:1];
	NSString *name = [[self.numbersArray objectAtIndex:[indexPath row]] objectAtIndex:0];
	
	[cell.textLabel setText: name];
	[cell.detailTextLabel setText:number];
	
	//
	//	Check if the number in this row is the default number
	//
	
	if ([[NSNumber numberWithInteger:[kSettings integerForKey:@"savedNumberIndex"]] isEqualToNumber:[NSNumber numberWithInteger:[indexPath row]] ]) {
		
		//
		//	This number is the default number, so show a checkmark next to it
		//
		
		[cell setAccessoryType:UITableViewCellAccessoryCheckmark];
	}else {
		
		//
		//	This number is not selected, don't show anything next to it
		//
		
		[cell setAccessoryType:UITableViewCellAccessoryNone];
	}
	
    return cell;
	

}


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	//
	//	Store the number in this row as the chosen number
	//
	
	[kSettings setValue:[[self.numbersArray objectAtIndex:[indexPath row]] objectAtIndex:1] forKey:@"savedNumber"];
	
	//
	//	Store the index of the saved number in the settings as well
	//
	
	[kSettings setInteger:[indexPath row] forKey:@"savedNumberIndex"];

	//
	//	Write the changes to disk
	//
	
	[kSettings synchronize];
	
	//
	//	Deselect the chosen row
	//
	
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	//
	//	Reload the table to reflect the changes
	//
	
	[self.tableView reloadData];
	
	//
	//	Inform the user that the next step is to flip the switch in the settings panel
	//
	
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Step 2:", @"")
													message:NSLocalizedString(@"Please open the Settings application and navigate to \"Hatzalah\". \nFlip the \"Call on Launch\" switch and you will be all set.\n\n To change your local Hatzalah number, flip the switch and relaunch this app.", @"")
												   delegate:nil 
										  cancelButtonTitle:NSLocalizedString(@"Okay", @"")
										  otherButtonTitles:nil];
	[alert show];
	[alert release];
 }

#pragma mark -
#pragma mark Header and footer

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
	
	//
	//	Return a localized header
	//
	
	return NSLocalizedString(@"Choose your emergency number:", @"");
}

/*
- (NSString *) tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
 //A test build used this, if you want you can add a footer
}
*/

#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}

- (void)dealloc {
	[numbersArray release];
    [super dealloc];
}


@end


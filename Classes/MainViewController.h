//
//  MainViewController.h
//  SpeedDial
//
//  Created by Moshe Berman on 12/10/10.
//  Copyright 2010 MosheBerman.com. All rights reserved.
//

#import "FlipsideViewController.h"
#import "SettingsView.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate> {
	IBOutlet SettingsView *numbersTable;
}

@property (nonatomic, retain) SettingsView *numbersTable;

- (IBAction)showInfo:(id)sender;

@end

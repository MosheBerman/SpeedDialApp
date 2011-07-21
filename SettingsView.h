//
//  SettingsView.h
//  SpeedDial
//
//  Created by Moshe Berman on 12/10/10.
//  Copyright 2010 MosheBerman.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"

@interface SettingsView : UITableViewController {
	NSArray *numbersArray;
}

@property (nonatomic, copy) NSArray *numbersArray;

@end

/*
 *  Constants.h
 *  SpeedDial
 *
 *  Created by Moshe Berman on 12/10/10.
 *  Copyright 2010 MosheBerman.com. All rights reserved.
 *
 */

//Reference to the User Defaults Store
#define kSettings [NSUserDefaults standardUserDefaults]

//Reference to the saved number
#define kSavedNumber [kSettings stringForKey:@"savedNumber"]

//Reference to the frame dimensions
#define kFrameSize self.view.frame.size

//Reference to the frame coordinates
#define kFrameOrigin self.view.frame.origin

//Height of top "info" bar (float value)
#define kInfoBarHeight 44.0f

//	The filename of the numbers plist
//
//	You should change this every time you 
//	change the numbers plist to ensure that the 
//	app does not use a cached list of numbers
//
#define kNumbersFileName @"Numbers_rev_2"

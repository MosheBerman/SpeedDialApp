//
//  SpeedDialAppDelegate.h
//  SpeedDial
//
//  Created by Moshe Berman on 12/10/10.
//  Copyright 2010 MosheBerman.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainViewController;

@interface SpeedDialAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MainViewController *mainViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MainViewController *mainViewController;

@end


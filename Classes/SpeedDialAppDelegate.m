//
//  SpeedDialAppDelegate.m
//  SpeedDial
//
//  Created by Moshe Berman on 12/10/10.
//  Copyright 2010 MosheBerman.com. All rights reserved.
//

#import "SpeedDialAppDelegate.h"
#import "MainViewController.h"

@implementation SpeedDialAppDelegate


@synthesize window;
@synthesize mainViewController;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions { 
	
	//
	//	Check for first run
	//
	
    if ([kSettings boolForKey:@"notFirstRun"] != YES) {
		[kSettings setValue:@"" forKey:@"savedNumber"];
		[kSettings setBool:YES forKey:@"notFirstRun"];
	}
	
	//
	//	Check if the "call on start" has been enabled
	//
	
	if([[NSUserDefaults standardUserDefaults] boolForKey:@"callOnStart"] == YES) {
		
		//
		//	It has, check for an emergency number
		//
		
		if ([kSavedNumber isEqualToString:@""]) {
			
			//
			//	There is no emergency number, so show an alert
			//	and then the menu to choose one
			//
			
			UIAlertView *a = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Choose your emergency number:", @"")
														message:NSLocalizedString(@"\"Call on launch\" is turned on, but there is no default number set. Please choose a number to call.", @"")
													   delegate:nil 
											  cancelButtonTitle:NSLocalizedString(@"Okay", @"") 
											  otherButtonTitles:nil];
			[a show];
			[a release];
			
		}else {
			
			//
			//	There is a number chosen,
			//	build the URL and check if
			//	the user has enabled VoIP.
			//
			
			NSURL *url;
			if ([kSettings boolForKey:@"useSkype"] == YES) {
				
				//
				//	Skype was enabled, build the Skype URL
				//
				
				url = [[[NSURL alloc] initWithString:[NSString stringWithFormat:@"skype://%@", kSavedNumber]] autorelease];
				
			}else if ([kSettings boolForKey:@"useFring"] == YES) {
					
				//
				//	Fring was enabled, build the Fring URL
				//
				
				url = [[[NSURL alloc] initWithString:[NSString stringWithFormat:@"fring://%@", kSavedNumber]] autorelease];

			}else{
				
				//
				//	Neither Skype nor Fring are enabled, build a telephone URL
				//	for the default phone app to use
				//
				
				url = [[[NSURL alloc] initWithString:[NSString stringWithFormat:@"tel://%@", kSavedNumber]] autorelease];
				
			}
			
			//
			//	Pass the phone URL to the Application. If all went well this 
			//	will launch the phone app
			//
			
			[[UIApplication sharedApplication] openURL:url];			
		}
		
	}else{
		
		//
		//	"Call on launch" is not enabled,
		//	prompt the user to choose a number
		//
		
		UIAlertView *a = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Step 1:", @"")
													message:NSLocalizedString(@"Please select the SpeedDial phone number in your area.", @"")
												   delegate:nil 
										  cancelButtonTitle:NSLocalizedString(@"Okay", @"")
										  otherButtonTitles:nil];
		[a show];
		[a release];
	}

	
     // Add the main view controller's view to the window and display.
    [self.window addSubview:mainViewController.view];
    [self.window makeKeyAndVisible];

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [mainViewController release];
    [window release];
    [super dealloc];
}

@end

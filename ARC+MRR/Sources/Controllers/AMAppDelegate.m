/*
 *	AMAppDelegate.m
 *	ARC+MRR
 *	
 *	Created by Diney Bomfim on 4/28/13.
 *	Copyright 2013 db-in. All rights reserved.
 */

#import "AMAppDelegate.h"

#pragma mark -
#pragma mark Constants
#pragma mark -
//**********************************************************************************************************
//
//	Constants
//
//**********************************************************************************************************

#pragma mark -
#pragma mark Private Interface
#pragma mark -
//**********************************************************************************************************
//
//	Private Interface
//
//**********************************************************************************************************

#pragma mark -
#pragma mark Private Definitions
//**************************************************
//	Private Definitions
//**************************************************

#pragma mark -
#pragma mark Private Functions
//**************************************************
//	Private Functions
//**************************************************

#pragma mark -
#pragma mark Private Category
//**************************************************
//	Private Category
//**************************************************

#pragma mark -
#pragma mark Public Interface
#pragma mark -
//**********************************************************************************************************
//
//	Public Interface
//
//**********************************************************************************************************

@implementation AMAppDelegate

#pragma mark -
#pragma mark Properties
//**************************************************
//	Properties
//**************************************************

@synthesize window = _window, viewController = _viewController;

#pragma mark -
#pragma mark Constructors
//**************************************************
//	Constructors
//**************************************************

#pragma mark -
#pragma mark Private Methods
//**************************************************
//	Private Methods
//**************************************************

#pragma mark -
#pragma mark Self Public Methods
//**************************************************
//	Self Public Methods
//**************************************************

#pragma mark -
#pragma mark Override Public Methods
//**************************************************
//	Override Public Methods
//**************************************************

- (BOOL) application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)options
{
	return YES;
}

- (void) applicationWillResignActive:(UIApplication *)application
{
	// Sent when the application is about to move from active to inactive state.
}

- (void) applicationDidEnterBackground:(UIApplication *)application
{
	// Use this method to release shared resources, save user data, invalidate timers, etc.
}

- (void) applicationWillEnterForeground:(UIApplication *)application
{
	// Called as part of the transition from the background to the inactive state.
}

- (void) applicationDidBecomeActive:(UIApplication *)application
{
	// Restart any tasks that were paused (or not yet started) while the application was inactive.
}

- (void) applicationWillTerminate:(UIApplication *)application
{
	// Called when the application is about to terminate.
}

- (void) dealloc
{
	arcRelease(_viewController);
	arcRelease(_window);
	
#ifndef IS_ARC
	[super dealloc];
#endif
}

@end
/*
 *	AMAppDelegate.h
 *	ARC+MRR
 *	
 *	Created by Diney Bomfim on 4/28/13.
 *	Copyright 2013 db-in. All rights reserved.
 */

#import <UIKit/UIKit.h>

#import "AMViewController.h"

@interface AMAppDelegate : UIResponder <UIApplicationDelegate>
{
@private
	
}

@property (nonatomic, RETAIN) UIWindow *window;
@property (nonatomic, RETAIN) AMViewController *viewController;

@end


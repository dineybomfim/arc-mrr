/*
 *	AMViewController.m
 *	ARC+MRR
 *	
 *	Created by Diney Bomfim on 4/28/13.
 *	Copyright 2013 db-in. All rights reserved.
 */

#import "AMViewController.h"

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

@implementation AMViewController

#pragma mark -
#pragma mark Properties
//**************************************************
//	Properties
//**************************************************

@synthesize weakProperty = _weakProperty, copiedProperty = _copiedProperty;

@dynamic strongProperty;

- (NSString *) strongProperty { return _strongString; }
- (void) setStrongProperty:(NSString *)value
{
	// Cocoa guidelines to properties.
	if (_strongString != value)
	{
		arcRelease(_strongString);
		_strongString = arcRetain(value);
	}
}

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

- (void) viewWillAppear:(BOOL)animated
{
	// Must call super to agree with the UIKit rules.
	[super viewWillAppear:animated];
	
	// Autoreleasing a var.
	NSMutableArray *array = arcAutorelease([[NSMutableArray alloc] init]);
	
	// Allocating and releasing variables inside a scope.
	unsigned int i, length = 10;
	for (i = 0; i < length; ++i)
	{
		NSString *__scopeVar1 = [[NSString alloc] initWithFormat:@"%i",i];
		[array addObject:__scopeVar1];
		arcRelease(__scopeVar1);
	}
	
	// Creating a strong var.
	arcRelease(_myDict);
	_myDict = [[NSDictionary alloc] initWithObjectsAndKeys:array, @"keyArray", nil];
	
	// Using weak references inside C struct.
	AMStruct aStruct = { 1, @"weak string" };
	
	// Assiging a weak var.
	_tempVar = aStruct.stringAtt;
	
	// Using the bridge.
	// Notice that here you could also use CFBridgingRelease, __bridge_transfer or __bridge_retained.
	// However remember that the goal here is to make it simple to Senior and Junior developers.
	// So, in my humble opinion, this is the best way to do: just use __bridge and keep moving away
	// from Core Foundation methods like CFRetain and CFRelease.
	CFStringRef cfString = CFStringCreateWithCString(NULL, "C String", kCFStringEncodingUTF8);
	aStruct.stringAtt = (ARC_BRIDGE NSString *)cfString;
	CFRelease(cfString);
}

- (void) dealloc
{
	arcRelease(_myDict);
	arcRelease(_strongString);
	arcRelease(_copiedProperty);
	
#ifndef IS_ARC
	[super dealloc];
#endif
}

@end
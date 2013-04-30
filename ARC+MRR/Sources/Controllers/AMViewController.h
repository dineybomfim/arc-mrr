/*
 *	AMViewController.h
 *	ARC+MRR
 *	
 *	Created by Diney Bomfim on 4/28/13.
 *	Copyright 2013 db-in. All rights reserved.
 */

#import <UIKit/UIKit.h>

typedef struct
{
	unsigned int normalAtt;
	ARC_UNSAFE NSString *stringAtt;
} AMStruct;

@interface AMViewController : UIViewController
{
@private
    NSDictionary *_myDict;
    ARC_ASSIGN NSString *_tempVar;
	ARC_RETAIN NSString *_strongString;
}

@property (nonatomic, RETAIN) NSString *strongProperty;
@property (nonatomic, ASSIGN) NSString *weakProperty;
@property (nonatomic, COPY) NSString *copiedProperty;

@end

/*
 *	ARC+MRR.h
 *	ARC+MRR
 *	
 *	Created by Diney Bomfim on 4/28/13.
 *	Copyright 2013 db-in. All rights reserved.
 */

// Defines the ARC instructions.
#if __has_feature(objc_arc)

	// ARC definition.
	#define IS_ARC

	// Convertion instructions.
	#define ARC_UNSAFE          __unsafe_unretained
	#define ARC_BRIDGE          __bridge
	#define ARC_ASSIGN          __weak
	#define ARC_RETAIN          __strong

	// Property definitions
	#define RETAIN              strong
	#define ASSIGN              weak
	#define COPY                copy

#else

	// Convertion instructions.
	#define ARC_UNSAFE
	#define ARC_BRIDGE
	#define ARC_ASSIGN
	#define ARC_RETAIN

	// Property definitions
	#define RETAIN              retain
	#define ASSIGN              assign
	#define COPY                copy

#endif

// The retain routine.
#ifdef IS_ARC
	#define arcRetain(x)        (x)
#else
	#define arcRetain(x)        ([x retain])
#endif

// The release routine.
#ifdef IS_ARC
	#define arcRelease(x)       ({ (x) = nil; })
#else
	#define arcRelease(x)       ({ if(x) { [x release]; (x) = nil; } })
#endif

// The autorelease routine.
#ifdef IS_ARC
	#define arcAutorelease(x)   (x)
#else
	#define arcAutorelease(x)   ([x autorelease])
#endif

// The free routine, not really necessary for ARC, but let's do it to make a safe free as well.
#define nppFree(x)              ({ if(x) { free(x); (x) = NULL; } })
//
//  WordAbrv.h
//  WordAbr
//
//  Created by Cortex on 10/31/13.
//  Copyright (c) 2013 Cortex. All rights reserved.
//


#import <Foundation/Foundation.h>


//Error codes
#define kErrorSentenceIsNil         -1000000
#define kErrorSentenceIsEmpty       -1000001


@interface WordAbrv : NSObject

+(NSString *) abbreviateSentence:(NSString *) sentence error:(NSError **) error;

@end

//
//  WordAbrv.m
//  WordAbrv
//
//  Created by Zaheer Naby on 10/31/13.
//  Copyright (c) 2013 Zaheer Naby. All rights reserved.
//


#import "WordAbrv.h"
#define kErrorDomain @"com.naby.zaheer.wordabrv"


@implementation WordAbrv

+(NSString *) abbreviateSentence:(NSString *) sentence error:(NSError **) error
{
    
    /* Check that senence is not nil */
    if(sentence == nil) {
        NSString * errorMessage = @"Sentence is nil";
        *error = [[NSError alloc] initWithDomain:kErrorDomain code:kErrorSentenceIsNil userInfo:@{NSLocalizedDescriptionKey: errorMessage}];
        return nil;
    }
    
    /* Check that sentence is not empty */
    if([sentence length] == 0) {
        NSString * errorMessage = @"Sentence is empty";
        *error = [[NSError alloc] initWithDomain:kErrorDomain code:kErrorSentenceIsEmpty userInfo:@{NSLocalizedDescriptionKey: errorMessage}];
        return  nil;
    }

    NSCharacterSet * alphaCharacterSet = [NSCharacterSet letterCharacterSet];
    NSMutableString * newSentence = [[NSMutableString alloc] init];
    NSString * abrvWord = nil;
    
    BOOL wordBegin = NO;
    NSInteger wordLength  = 0;
    
    unichar startWordLetter = 0;
    unichar endWordLetter = 0;
    unichar character = 0;
    
    for(NSInteger x = 0; x < [sentence length]; x++)
    {
        character = [sentence characterAtIndex:x];
        
        if([alphaCharacterSet characterIsMember:character])
        {
            //Check if we're at the beginning of a new word.
            if(wordBegin == NO) {
                wordBegin = YES;
                wordLength = 1;
                startWordLetter = character;
                
            }
            else {
                wordLength++;
            }
            endWordLetter = character;

        }
        else
        {
            if(wordBegin == YES)
            {
                //We passed the end of the word.
                wordBegin = NO;

                if(wordLength < 3)
                    abrvWord = [NSString stringWithFormat:@"%C%C%C", startWordLetter, endWordLetter, character];
                else
                    abrvWord = [NSString stringWithFormat:@"%C%i%C%C", startWordLetter, wordLength-2,  endWordLetter, character];
                
                [newSentence appendString:abrvWord];
                
            }
            else
                [newSentence appendFormat:@"%C", character];
            
            
            wordLength = 0;
            
        }
    }
    
    //If the last character isn't non-alpha numeric we need to add the abbreviated word.
    if(wordBegin == YES) {
        if(wordLength < 3)
            abrvWord = [NSString stringWithFormat:@"%C%C", startWordLetter, endWordLetter];
        else
            abrvWord = [NSString stringWithFormat:@"%C%i%C", startWordLetter, wordLength-2,  endWordLetter];

        [newSentence appendString:abrvWord];

    }
    
    return newSentence;
    
}

@end

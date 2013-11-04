//
//  ViewController.m
//  WordAbr
//
//  Created by Cortex on 10/31/13.
//  Copyright (c) 2013 Cortex. All rights reserved.
//

#import "ViewController.h"
#import "WordAbrv.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSString * sentence = @"The red brown fox, jumped over the lazy dog";
    NSError * error = nil;
    NSString * newSentence = [WordAbrv abbreviateSentence:sentence error:&error];
    NSLog(@"Orig: %@\nNew: %@", sentence, newSentence);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

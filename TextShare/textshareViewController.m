//
//  textshareViewController.m
//  TextShare
//
//  Created by Fauzan, Muhammad - CW on 3/28/13.
//  Copyright (c) 2013 Fauzan, Muhammad - CW. All rights reserved.
//

#import "textshareViewController.h"
#import "textshareBumpController.h"
@interface textshareViewController ()

@end

@implementation textshareViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [bumpButton addTarget:self action:@selector(onBumpButtonClick:) forControlEvents:(UIControlEvents)UIControlEventTouchDown];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)getYourThoughts{
    NSString *thought = bumpField.text;
    bumpField.text = @"";
    return thought;
}

- (void)setFriendMessage:(NSString *)message{
    bumpedMessageBox.text = message;
}

- (void) easyBump:(id)sender{
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [textshareBumpController configureBump:self];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}


//Handler for onclick button

- (void)onBumpButtonClick:(id)sender{
    [textshareBumpController simulateBump];
}

@end

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
    [bumpTimerButton addTarget:self action:@selector(onTimedBumpButtonClick:) forControlEvents:(UIControlEvents)UIControlEventTouchDown];
    //set to NO to enable bump with timer button
    bumpTimerButton.hidden = YES;
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


//Handle for active/inactive bump button
- (void)setButtonStatus:(BOOL)isactive{
    [bumpButton setEnabled:isactive];
}

//Handler for onclick button

- (void)onBumpButtonClick:(id)sender{
    [self startBumping];
}

//Handle timer bump
- (void)onTimedBumpButtonClick:(id)sender{
    NSNumber*currentTime = [NSNumber numberWithDouble:[[NSDate date] timeIntervalSince1970]];
    //get next 5 seconds timestamp
    long temp1 = [currentTime longValue]/10;
    long temp2 = temp1 * 10 + 10;
    NSLog(@"Current time : %ld",[currentTime longValue]);
    NSLog(@"Balance time : %ld",temp2);
    UILocalNotification * localNotif = [[UILocalNotification alloc]init];
    NSDate * nextDate = [NSDate dateWithTimeIntervalSince1970:temp2];
    localNotif.fireDate = nextDate;
    localNotif.alertAction = @"BUMP!";
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotif];
    localNotif = NULL;
}

- (void) startBumping{
    [textshareBumpController simulateBump];
    NSLog(@"Bump at %f", [NSDate timeIntervalSinceReferenceDate]);
}


@end

//
//  textshareViewController.h
//  TextShare
//
//  Created by Fauzan, Muhammad - CW on 3/28/13.
//  Copyright (c) 2013 Fauzan, Muhammad - CW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface textshareViewController : UIViewController {
    IBOutlet UITextField * bumpField;
    IBOutlet UITextView * bumpedMessageBox;
    IBOutlet UIButton * bumpButton;
    IBOutlet UIButton * bumpTimerButton;
}

- (void)setFriendMessage:(NSString *) message;
- (NSString *)getYourThoughts;
- (void)setButtonStatus:(BOOL)isactive;
- (IBAction)easyBump:(id)sender;
- (void) startBumping;
@end

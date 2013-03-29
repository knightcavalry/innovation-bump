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
}

- (void)setFriendMessage:(NSString *) message;
- (NSString *)getYourThoughts;

- (IBAction)easyBump:(id)sender;

@end

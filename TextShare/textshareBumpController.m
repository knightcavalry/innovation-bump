//
//  textshareBumpController.m
//  TextShare
//
//  Created by Fauzan, Muhammad - CW on 3/28/13.
//  Copyright (c) 2013 Fauzan, Muhammad - CW. All rights reserved.
//

#import "textshareBumpController.h"
#import "textshareViewController.h"
#import "BumpClient.h"

@implementation textshareBumpController


+ (void)simulateBump{
    BumpClient *client = [BumpClient sharedClient];
    [client simulateBump];
}

+ (void) configureBump:(textshareViewController *)viewController{
    [BumpClient configureWithAPIKey:@"5cedbb5f68114748a1e35686c03cecc3" andUserID:[[UIDevice currentDevice] name]];
    
    [[BumpClient sharedClient] setMatchBlock:^(BumpChannelID channel) {
        NSLog(@"Matched with user: %@", [[BumpClient sharedClient] userIDForChannel:channel]);
        [[BumpClient sharedClient] confirmMatch:YES onChannel:channel];
    }];
    
    [[BumpClient sharedClient] setChannelConfirmedBlock:^(BumpChannelID channel) {
        NSLog(@"Channel with %@ confirmed.", [[BumpClient sharedClient] userIDForChannel:channel]);
        [[BumpClient sharedClient] sendData:[[viewController getYourThoughts] dataUsingEncoding:NSUTF8StringEncoding]
                                  toChannel:channel];
    }];
    
    [[BumpClient sharedClient] setDataReceivedBlock:^(BumpChannelID channel, NSData *data) {
        NSLog(@"Data received from %@: %@", [[BumpClient sharedClient] userIDForChannel:channel], [NSString stringWithCString:[data bytes] encoding:NSUTF8StringEncoding]);
        NSString * message = [NSString stringWithCString:[data bytes] encoding:NSUTF8StringEncoding];
        [viewController setFriendMessage:message];
    }];
    
    [[BumpClient sharedClient] setConnectionStateChangedBlock:^(BOOL connected) {
        if (connected) {
            NSLog(@"Bump connected...");
        } else {
            NSLog(@"Bump disconnected...");
        }
    }];
    
    [[BumpClient sharedClient] setBumpEventBlock:^(bump_event event) {
        switch(event) {
            case BUMP_EVENT_BUMP:
                NSLog(@"Bump detected.");
                break;
            case BUMP_EVENT_NO_MATCH:
                NSLog(@"No match.");
                break;
        }
    }];
}


@end

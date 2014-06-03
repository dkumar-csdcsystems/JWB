//
//  LoginPopoverViewController.h
//  JWBNative
//
//  Created by CSDC on 6/2/14.
//  Copyright (c) 2014 CSDC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginPopoverViewController : UIViewController

@property (nonatomic, retain) IBOutlet UIButton *cancelButton;
@property (nonatomic, retain) IBOutlet UIButton *settingButton;

-(IBAction)settingClicked:(UIButton *)sender;

//- (IBAction)unwindToPopoverViewController:(UIStoryboardSegue *)unwindSegue;
@end

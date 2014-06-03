//
//  LoginViewController.h
//  JWBNative
//
//  Created by CSDC on 6/2/14.
//  Copyright (c) 2014 CSDC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginPopoverViewController.h"

@interface LoginViewController : UIViewController

@property (nonatomic, retain) IBOutlet UIButton *loginButton;
@property (nonatomic, retain) IBOutlet UITextField *textLoginId;
@property (nonatomic, retain) IBOutlet UITextField *textPassword;

- (IBAction)infoClicked:(UIButton *)sender;
- (IBAction)unwindToLoginViewController:(UIStoryboardSegue *)unwindSegue;
- (IBAction)loginClicked:(id)sender;
@end

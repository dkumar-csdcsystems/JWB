//
//  SettingViewController.h
//  JWBNative
//
//  Created by CSDC on 6/2/14.
//  Copyright (c) 2014 CSDC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Setting.h"

@interface SettingViewController : UIViewController<UITextFieldDelegate>

//@property (nonatomic, retain) IBOutlet UIButton *cancelButton;
//@property (nonatomic, retain) IBOutlet UIButton *updateButton;
@property (nonatomic, retain) IBOutlet UITextField *textServiceUrl;
@property (nonatomic, retain) IBOutlet UITextField *textConnectionCache;

@property (nonatomic, strong) Setting* setting;

@property (nonatomic) BOOL Update;

@end

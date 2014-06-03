//
//  LoginPopoverViewController.m
//  JWBNative
//
//  Created by CSDC on 6/2/14.
//  Copyright (c) 2014 CSDC. All rights reserved.
//

#import "LoginPopoverViewController.h"
#import "SettingViewController.h"

@interface LoginPopoverViewController ()

@end

@implementation LoginPopoverViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)settingClicked:(UIButton *)sender{
    /*
    SettingViewController *settingView = [self.storyboard instantiateViewControllerWithIdentifier:@"SettingView"];
    [self presentViewController:settingView animated:true completion:nil];
     */
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
}
*/

- (IBAction)unwindToPopoverViewController:(UIStoryboardSegue *)unwindSegue{

}

@end

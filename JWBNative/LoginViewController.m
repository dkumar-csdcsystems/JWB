//
//  LoginViewController.m
//  JWBNative
//
//  Created by CSDC on 6/2/14.
//  Copyright (c) 2014 CSDC. All rights reserved.
//

#import "LoginViewController.h"
#import "SettingViewController.h"

@interface LoginViewController ()
@property (nonatomic,strong) UIPopoverController *popOver;
@end

@implementation LoginViewController

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)infoClicked:(UIButton *)sender {
    UIView *anchor = sender;
    LoginPopoverViewController *popovercontroller = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginPopoverViewController"];
    self.popOver = [[UIPopoverController alloc] initWithContentViewController:popovercontroller];
    [self.popOver presentPopoverFromRect:anchor.frame inView:anchor.superview permittedArrowDirections:UIPopoverArrowDirectionAny animated:true];
    
}

-(IBAction)unwindToLoginViewController:(UIStoryboardSegue *)unwindSegue{
    SettingViewController *settingViewController = unwindSegue.sourceViewController;
    if(settingViewController != nil){
        
    }
}

@end

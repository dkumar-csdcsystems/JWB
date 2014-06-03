//
//  LoginViewController.m
//  JWBNative
//
//  Created by CSDC on 6/2/14.
//  Copyright (c) 2014 CSDC. All rights reserved.
//

#import "LoginViewController.h"
#import "SettingViewController.h"
#import "LocalStoreHelper.h"
#import "ServiceHelper.h"
#import "JsonHelper.h"
#import "ServerResponse.h"

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
        if(settingViewController.Update){
            NSString *jsonString = [settingViewController.setting getJosnString];
            [LocalStoreHelper savePreferences:@"Setting" data:jsonString];
        }
    }
}

- (IBAction)loginClicked:(id)sender{
    if(![self.textLoginId.text isEqual:@""] && ![self.textLoginId.text isEqual:@""] ){
        //NSString *userId = [NSString stringWithString: self.textLoginId.text];
        //NSString *password = [NSString stringWithString: self.textPassword.text];
        
        NSString *userId =  self.textLoginId.text;
        NSString *password = self.textPassword.text;
        
        Setting *setting = [Setting getPreference];
        if(setting){
            NSDictionary *params= [NSDictionary dictionaryWithObjectsAndKeys:
                                   setting.ConnectionCache, @"CC",
                                   userId, @"username",
                                   password, @"password",
                                   @"authenticateUser", @"methodName", nil];
            
            
            [ServiceHelper prepareAndSend:setting.ServiceUrl
                              PostData:params
                          onCompletion:^(NSString *result, NSError *error) {
                //dispatch_get_main_queue - get ui thread
                //dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
                dispatch_async(dispatch_get_main_queue(), ^{
                    if(error){
                        //[self stopFetching:@"Failed to load"];
                        NSLog(@"%@", error);
                    } else {
                        ServerResponse *response = [ServerResponse parseJson:result];
                        //NSLog(@"%@",result);
                        //[self stopFetching:result];
                    }
                });
            }];
        } else {
            //display message to fill up setting
        }
        
    }
}

@end

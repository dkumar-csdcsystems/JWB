//
//  SettingViewController.m
//  JWBNative
//
//  Created by CSDC on 6/2/14.
//  Copyright (c) 2014 CSDC. All rights reserved.
//

#import "SettingViewController.h"
#import "LocalStoreHelper.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

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
    
    self.setting = [Setting getPreference];
    if(self.setting != nil){
        [self.textConnectionCache setText:self.setting.ConnectionCache];
        [self.textServiceUrl setText:self.setting.ServiceUrl];
    }
   
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //self.ServiceUrl = self.textServiceUrl.text;
    //self.ConnectionCache = self.textConnectionCache.text;
    if(self.setting == nil){
        self.setting = [[Setting alloc] init];
    }
    self.setting.ConnectionCache = self.textConnectionCache.text;
    self.setting.ServiceUrl = self.textServiceUrl.text;
}


-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    if([identifier isEqualToString:@"UpdateSetting"]){
        if([self.textServiceUrl.text isEqualToString:@""] || [self.textConnectionCache.text isEqualToString:@""]){
            return NO;
        }
        self.Update = true;
    } else {
        self.Update = false;
    }
    
    return YES;
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    if([self.textConnectionCache isEqual:textField]){
        [self.textConnectionCache resignFirstResponder];
    } else {
        [self.textServiceUrl resignFirstResponder];
    }
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [[event allTouches] anyObject];
    if ([self.textConnectionCache isFirstResponder] && ![[touch view] isEqual:self.textConnectionCache]) {
        [self.textConnectionCache resignFirstResponder];
    } else if([self.textServiceUrl isFirstResponder] && ![[touch view] isEqual:self.textServiceUrl]){
        [self.textServiceUrl resignFirstResponder];
    }
    [super touchesBegan:touches withEvent:event];
}

@end

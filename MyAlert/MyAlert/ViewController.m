//
//  ViewController.m
//  MyAlert
//
//  Created by ap2 on 16/2/17.
//  Copyright © 2016年 ap2. All rights reserved.
//

#import "ViewController.h"
#import "CustomIOSAlertView.h"
#import "SubAlertView.h"

@interface ViewController ()<CustomIOSAlertViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Just a subtle background color
    [self.view setBackgroundColor:[UIColor colorWithRed:0.8f green:0.8f blue:0.8f alpha:1.0f]];
    
    // A simple button to launch the demo
    UIButton *launchDialog = [UIButton buttonWithType:UIButtonTypeCustom];
    [launchDialog setFrame:CGRectMake(10, 30, self.view.bounds.size.width-20, 50)];
    [launchDialog addTarget:self action:@selector(launchDialog:) forControlEvents:UIControlEventTouchDown];
    [launchDialog setTitle:@"Launch Dialog" forState:UIControlStateNormal];
    [launchDialog setBackgroundColor:[UIColor whiteColor]];
    [launchDialog setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [launchDialog.layer setBorderWidth:0];
    [launchDialog.layer setCornerRadius:5];
    [self.view addSubview:launchDialog];
    
    // A simple button to launch the demo
    UIButton *sublaunchDialog = [UIButton buttonWithType:UIButtonTypeCustom];
    [sublaunchDialog setFrame:CGRectMake(10, 30+ 100, self.view.bounds.size.width-20, 50)];
    [sublaunchDialog addTarget:self action:@selector(subAction) forControlEvents:UIControlEventTouchDown];
    [sublaunchDialog setTitle:@"sub Dialog" forState:UIControlStateNormal];
    [sublaunchDialog setBackgroundColor:[UIColor whiteColor]];
    [sublaunchDialog setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [sublaunchDialog.layer setBorderWidth:0];
    [sublaunchDialog.layer setCornerRadius:5];
    [self.view addSubview:sublaunchDialog];
}

- (void)subAction
{
    // Here we need to pass a full frame
    SubAlertView *alertView = [SubAlertView alert];
    
    [alertView setOnButtonTouchUpInside:^(CustomIOSAlertView *alertView, int buttonIndex) {
        NSLog(@"Block: Button at position %d is clicked on alertView %d.", buttonIndex, (int)[alertView tag]);
        [alertView close];
    }];
    
    [alertView show];
}

- (IBAction)launchDialog:(id)sender
{
    // Here we need to pass a full frame
    CustomIOSAlertView *alertView = [[CustomIOSAlertView alloc] init];
    
    // Add some custom content to the alert view
    [alertView setContainerView:[self createDemoView]];
    
    // Modify the parameters
    [alertView setButtonTitles:[NSMutableArray arrayWithObjects:@"Close1", @"Close2", @"Close3", nil]];
    [alertView setDelegate:self];
    
    // You may use a Block, rather than a delegate.
    [alertView setOnButtonTouchUpInside:^(CustomIOSAlertView *alertView, int buttonIndex) {
        NSLog(@"Block: Button at position %d is clicked on alertView %d.", buttonIndex, (int)[alertView tag]);
        [alertView close];
    }];
    
    [alertView setUseMotionEffects:true];
    
    // And launch the dialog
    [alertView show];
}

- (void)customIOS7dialogButtonTouchUpInside: (CustomIOSAlertView *)alertView clickedButtonAtIndex: (NSInteger)buttonIndex
{
    NSLog(@"Delegate: Button at position %d is clicked on alertView %d.", (int)buttonIndex, (int)[alertView tag]);
    [alertView close];
}

- (UIView *)createDemoView
{
    UIView *demoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 290, 10)];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 270, 10)];
    [imageView setImage:[UIImage imageNamed:@"demo"]];
    [demoView addSubview:imageView];
    
    return demoView;
}

@end

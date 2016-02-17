//
//  SubAlertView.m
//  CustomIOSAlertView
//
//  Created by ap2 on 16/2/17.
//  Copyright © 2016年 Wimagguc. All rights reserved.
//

#import "SubAlertView.h"

@implementation SubAlertView


/**
 *  重写父类的方法，添加自定义类型的按钮
 *
 *  @param container <#container description#>
 */
- (void)addButtonsToView: (UIView *)container
{
    if (self.buttonTitles==NULL) { return; }
    
    CGFloat buttonWidth = container.bounds.size.width / [self.self.buttonTitles count];
    NSArray *colors = @[[UIColor greenColor], [UIColor grayColor],[UIColor blueColor]];
    
    for (int i=0; i<[self.self.buttonTitles count]; i++) {
        
        UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [closeButton setFrame:CGRectMake(i * buttonWidth + 5, container.bounds.size.height - 30, 60, 30)];
        
        [closeButton addTarget:self action:@selector(customIOS7dialogButtonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
        [closeButton setTag:i];
        
        [closeButton setTitle:[self.self.buttonTitles objectAtIndex:i] forState:UIControlStateNormal];
        [closeButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [closeButton setTitleColor:[UIColor colorWithRed:0.2f green:0.2f blue:0.2f alpha:0.5f] forState:UIControlStateHighlighted];
        [closeButton.titleLabel setFont:[UIFont boldSystemFontOfSize:14.0f]];
        [closeButton setBackgroundColor:colors[i]];
        //[closeButton.layer setCornerRadius:kCustomIOSAlertViewCornerRadius];
        
        [container addSubview:closeButton];
    }
}

+ (SubAlertView *)alert
{
    // Here we need to pass a full frame
    SubAlertView *alertView = [[SubAlertView alloc] init];
    
    // Add some custom content to the alert view
    [alertView setContainerView:[SubAlertView createDemoView]];
    
    // Modify the parameters
    [alertView setButtonTitles:[NSMutableArray arrayWithObjects:@"sub1", @"sub2", @"sub3", nil]];
   
    [alertView setUseMotionEffects:true];
    
    return alertView;
}

+ (UIView *)createDemoView
{
    UIView *demoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 290, 50)];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 270, 50)];
    [imageView setImage:[UIImage imageNamed:@"demo"]];
    [demoView addSubview:imageView];
    
    return demoView;
}

@end

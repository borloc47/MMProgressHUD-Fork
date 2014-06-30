//
//  MMAppearanceSetup.m
//  MMProgressHUDDemo
//
//  Created by Maxim on 6/20/14.
//  Copyright (c) 2014 Mutual Mobile. All rights reserved.
//

#import "MMAppearanceSetup.h"
#import "MMProgressHUD.h"

@implementation MMAppearanceSetup

+ (void)setup
{
    [MMProgressHUD appearance].hudBackgroundColor = [UIColor lightGrayColor];
    
    [MMProgressHUD appearance].titleColor = [UIColor redColor];
    [MMProgressHUD appearance].statusColor = [UIColor greenColor];
    [MMProgressHUD appearance].activityIndicatorColor = [UIColor blackColor];
    [MMProgressHUD appearance].titleShadowColor = [UIColor blackColor];
    [MMProgressHUD appearance].statusShadowColor = [UIColor blackColor];

    [MMProgressHUD appearance].titleFont = [UIFont boldSystemFontOfSize:12];
    [MMProgressHUD appearance].statusFont = [UIFont systemFontOfSize:14];

    [MMProgressHUD appearance].cornerRadius = 30;
    
//    [[MMProgressHUD appearance] setHudSizeMode:MMHUDSizeModeDefault withWidth:0 height:0];
//    or
//    [[MMProgressHUD appearance] setHudSizeMode:MMHUDSizeModeConstantSize withWidth:200 height:200];
//    or
    [[MMProgressHUD appearance] setHudSizeMode:MMHUDSizeModeMinSize withWidth:137 height:137];

    [MMProgressHUD appearance].titleShadowOffset = CGSizeZero;
    [MMProgressHUD appearance].statusShadowOffset = CGSizeZero;

//    [MMProgressHUD appearance].titleOffset = CGPointMake(0, -20);
//    [MMProgressHUD appearance].middleAreaOffset = CGPointMake(0, -20);
//    [MMProgressHUD appearance].statusOffset = CGPointMake(0, 20);
}

@end

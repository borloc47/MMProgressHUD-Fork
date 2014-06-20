//
//  MMAppearanceSetup.m
//  MMProgressHUDDemo
//
//  Created by Maxim on 6/20/14.
//  Copyright (c) 2014 Mutual Mobile. All rights reserved.
//

#import "MMAppearanceSetup.h"
#import "MMHudAppearance.h"

@implementation MMAppearanceSetup

+ (void)setup
{
    MMHudAppearance *appearance = [MMHudAppearance appearance];
    
    appearance.backgroundColor = [UIColor darkGrayColor];
    appearance.titleColor = [UIColor redColor];
    appearance.statusColor = [UIColor greenColor];
    appearance.activityIndicatorColor = [UIColor blackColor];
//    appearance.titleShadowColor = [UIColor blackColor];
//    appearance.statusShadowColor = [UIColor blackColor];

    appearance.titleFont = [UIFont boldSystemFontOfSize:12];
    appearance.statusFont = [UIFont systemFontOfSize:14];
    
    appearance.cornerRadius = 20;


//    Specifies positions for all zones on the hud

    [appearance setHudConstantSize:CGSizeMake(137, 137)];
 
//    or
 
//    [appearance setHudConstantSize:CGSizeMake(200, 200)
//                  titleCenterPoint:CGPointMake(10, 20)
//                contentCenterPoint:CGPointMake(40, 60)
//                 statusCenterPoint:CGPointMake(80, 100)];
//*/
    
    appearance.titleShadowOffset = CGSizeZero;
    appearance.statusShadowOffset = CGSizeZero;
}

@end

//
//  MMHudAppearance.h
//  MMProgressHUDDemo
//
//  Created by Maxim on 6/19/14.
//  Copyright (c) 2014 Mutual Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ENUM(NSInteger, MMHUDSizeMode) {
    MMHUDSizeModeDefault,            //hud provides default MMHud behaviour, without any changes
    MMHUDSizeModeConstantSize,       //hud has constant size and does not adjust to content needs
    MMHUDSizeModeMinSize,            //hud adjusts its size to content needs, but has min size limitation
};

@interface MMHudAppearance : NSObject <UIAppearance>

@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic, strong) UIColor *titleColor;
@property (nonatomic, strong) UIColor *statusColor;
@property (nonatomic, strong) UIColor *activityIndicatorColor;
@property (nonatomic, strong) UIColor *titleShadowColor;
@property (nonatomic, strong) UIColor *statusShadowColor;
@property (nonatomic, strong) UIColor *shadowColor;

@property (nonatomic, strong) UIFont *titleFont;
@property (nonatomic, strong) UIFont *statusFont;

@property(nonatomic, assign) CGSize titleShadowOffset;
@property(nonatomic, assign) CGSize statusShadowOffset;

@property (nonatomic, assign) CGFloat cornerRadius;
@property (nonatomic, assign) CGFloat shadowOpacity;
@property (nonatomic, assign) CGFloat shadowRadius;

@property (nonatomic, assign, readonly) enum MMHUDSizeMode sizeMode;

@property (nonatomic, assign, readonly) CGSize constantSize;
@property (nonatomic, assign, readonly) CGSize minSize;

@property (nonatomic, assign) CGPoint titleOffset;
@property (nonatomic, assign) CGPoint middleAreaOffset;
@property (nonatomic, assign) CGPoint statusOffset;

- (void)makeHudToBeWithDefaultSize;
- (void)makeHudToBeWithConstantSize:(CGSize)constantSize;
- (void)makeHudToBeWithMinSize:(CGSize)minSize;

@end

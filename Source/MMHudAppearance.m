//
//  MMHudAppearance.m
//  MMProgressHUDDemo
//
//  Created by Maxim on 6/19/14.
//  Copyright (c) 2014 Mutual Mobile. All rights reserved.
//

#import "MMHudAppearance.h"

NSString * const kMMProgressHUDFontNameBold = @"HelveticaNeue-Bold";
NSString * const kMMProgressHUDFontNameNormal = @"HelveticaNeue-Light";
CGFloat    const kMMProgressHUDDefaultFontSize           = 16.f;

@interface MMHudAppearance ()

@property (nonatomic, assign) enum MMHUDSizeMode sizeMode;
@property (nonatomic, assign) CGSize constantSize;
@property (nonatomic, assign) CGSize minSize;

@end

@implementation MMHudAppearance

+ (instancetype)appearance
{
    static MMHudAppearance *sharedMMHudAppearance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMMHudAppearance = [MMHudAppearance new];
    });
    
    return sharedMMHudAppearance;
}

+ (instancetype)appearanceWhenContainedIn:(Class<UIAppearanceContainer>)ContainerClass, ... {
    return [self appearance];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.75];
        self.titleColor = [UIColor whiteColor];
        self.statusColor = [UIColor colorWithWhite:0.9f alpha:0.95f];
        self.activityIndicatorColor = [UIColor whiteColor];
        self.shadowColor = [UIColor blackColor];
        self.titleShadowColor = [UIColor blackColor];
        self.statusShadowColor = [UIColor blackColor];
        
        self.titleFont = [UIFont fontWithName:kMMProgressHUDFontNameBold size:kMMProgressHUDDefaultFontSize];
        self.statusFont = [UIFont fontWithName:kMMProgressHUDFontNameNormal size:kMMProgressHUDDefaultFontSize];;
        
        self.cornerRadius = 10.0f;

        self.shadowOpacity = 0.5f;
        self.shadowRadius = 15.0f;
        
        self.minSize = CGSizeZero;
        self.constantSize = CGSizeZero;
        
        self.titleOffset = CGPointZero;
        self.middleAreaOffset = CGPointZero;
        self.statusOffset = CGPointZero;
        
        self.titleShadowColor = [UIColor blackColor];
        self.titleShadowOffset = CGSizeMake(0, -1);
        
        self.statusShadowColor = [UIColor blackColor];
        self.statusShadowOffset = CGSizeMake(0, -1);
    }
    return self;
}

- (void)makeHudToBeWithDefaultSize
{
    self.sizeMode = MMHUDSizeModeDefault;
}

- (void)makeHudToBeWithConstantSize:(CGSize)constantSize
{
    self.sizeMode = MMHUDSizeModeConstantSize;
    self.constantSize = constantSize;
}

- (void)makeHudToBeWithMinSize:(CGSize)minSize
{
    self.sizeMode = MMHUDSizeModeMinSize;
    self.minSize = minSize;
}

@end

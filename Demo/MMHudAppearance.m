//
//  MMHudAppearance.m
//  MMProgressHUDDemo
//
//  Created by Maxim on 6/19/14.
//  Copyright (c) 2014 Mutual Mobile. All rights reserved.
//

#import "MMHudAppearance.h"

NSString * const MMProgressHUDFontNameBold = @"HelveticaNeue-Bold";
NSString * const MMProgressHUDFontNameNormal = @"HelveticaNeue-Light";
CGFloat    const MMProgressHUDDefaultFontSize           = 16.f;

@interface MMHudAppearance ()

@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint titleCenterPoint;
@property (nonatomic, assign) CGPoint contentCenterPoint;
@property (nonatomic, assign) CGPoint statusCenterPoint;
@property (nonatomic, assign) BOOL usesContstantSizeForHudAndCenterPoints;

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
        
        self.usesContstantSizeForHudAndCenterPoints = NO;
        self.titleFont = [UIFont fontWithName:MMProgressHUDFontNameBold size:MMProgressHUDDefaultFontSize];
        self.statusFont = [UIFont fontWithName:MMProgressHUDFontNameNormal size:MMProgressHUDDefaultFontSize];;
        
        self.cornerRadius = 10.0f;
        
        self.backgroundImage = nil;
        
        self.size = CGSizeZero;
        self.titleCenterPoint = CGPointZero;
        self.contentCenterPoint = CGPointZero;
        self.statusCenterPoint = CGPointZero;
    }
    return self;
}

- (void)setHudConstantSize:(CGSize)size
{
    [self setHudConstantSize:size
            titleCenterPoint:CGPointMake(size.width/2, size.height/6)
          contentCenterPoint:CGPointMake(size.width/2, size.height/2)
           statusCenterPoint:CGPointMake(size.width/2, size.height-size.height/6)];
}

- (void)setHudConstantSize:(CGSize)size
          titleCenterPoint:(CGPoint)titleCenterPoint
        contentCenterPoint:(CGPoint)contentCenterPoint
         statusCenterPoint:(CGPoint)statusCenterPoint
{
    self.usesContstantSizeForHudAndCenterPoints = YES;
    
    self.size = size;
    self.titleCenterPoint = titleCenterPoint;
    self.contentCenterPoint = contentCenterPoint;
    self.statusCenterPoint = statusCenterPoint;
}


@end

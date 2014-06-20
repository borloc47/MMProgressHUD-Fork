//
//  MMHudAppearance.h
//  MMProgressHUDDemo
//
//  Created by Maxim on 6/19/14.
//  Copyright (c) 2014 Mutual Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMHudAppearance : NSObject <UIAppearance>

@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic, strong) UIColor *titleColor;
@property (nonatomic, strong) UIColor *statusColor;
@property (nonatomic, strong) UIColor *activityIndicatorColor;
@property (nonatomic, strong) UIColor *titleShadowColor;
@property (nonatomic, strong) UIColor *statusShadowColor;

@property (nonatomic, strong) UIFont *titleFont;
@property (nonatomic, strong) UIFont *statusFont;

@property(nonatomic, assign) CGSize titleShadowOffset;
@property(nonatomic, assign) CGSize statusShadowOffset;

@property (nonatomic, assign) CGFloat cornerRadius;
@property (nonatomic, assign) CGFloat shadowOpacity;
@property (nonatomic, assign) CGFloat shadowRadius;


@property (nonatomic, assign, readonly) BOOL usesContstantSizeForHudAndCenterPoints;
@property (nonatomic, assign, readonly) CGSize size;
@property (nonatomic, assign, readonly) CGPoint titleCenterPoint;
@property (nonatomic, assign, readonly) CGPoint contentCenterPoint;
@property (nonatomic, assign, readonly) CGPoint statusCenterPoint;


- (void)setHudConstantSize:(CGSize)size;

- (void)setHudConstantSize:(CGSize)size
          titleCenterPoint:(CGPoint)titleCenterPoint
        contentCenterPoint:(CGPoint)contentCenterPoint
         statusCenterPoint:(CGPoint)statusCenterPoint;

@end

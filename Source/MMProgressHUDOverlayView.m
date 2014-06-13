//
//  MMProgressHUDOverlayView.m
//  MMProgressHUDDemo
//
//  Created by Lars Anderson on 7/5/12.
//  Copyright (c) 2012 Mutual Mobile. All rights reserved.
//

#import "MMProgressHUDOverlayView.h"

#import "UIView+MMSnapshot.h"
#import "UIImage+ImageEffects.h"

@interface MMProgressHUDOverlayView() {
    UIImageView *_blurImageView;
}

@property (nonatomic) CGGradientRef gradientRef;

@end

@implementation MMProgressHUDOverlayView

- (instancetype)init {
    self = [self initWithFrame:CGRectZero];
    if (self) {
        //do more stuff
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [self initWithFrame:frame overlayMode:MMProgressHUDWindowOverlayModeGradient];
    if (self) {
        //do stuff
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame overlayMode:(MMProgressHUDWindowOverlayMode)overlayMode {
    self = [super initWithFrame:frame];
    if (self) {
        _blurImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [_blurImageView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
        [self addSubview:_blurImageView];

        [self setOverlayMode:overlayMode];

        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGFloat r = 0/255.0;
        CGFloat g = 0/255.0;
        CGFloat b = 0/255.0;
        CGFloat a = 0/255.0;  
        CGFloat components[4] = {r,g,b,a};
        
        _overlayColor = CGColorCreate(colorSpace, components);
        CGColorSpaceRelease(colorSpace);
        
        self.opaque = NO;
        
        [self _buildGradient];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
//    [super drawRect:rect];
    
    switch (self.overlayMode) {
        case MMProgressHUDWindowOverlayModeGradient:
            [self _drawRadialGradientInRect:rect];
            break;

        case MMProgressHUDWindowOverlayModeLinear:
            [self _drawLinearOverlayInRect:rect];
            break;

        case MMProgressHUDWindowOverlayModeBlur:
            [self _renderBlurInRect:rect];
            break;

        default:
            break;
    }
}

- (void)_buildGradient {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdirect-ivar-access"
    if (_gradientRef) {
        CGGradientRelease(_gradientRef);
    }
    
    NSAssert(self.overlayColor, @"Overlay color is nil!");
    
    CGColorRef firstColor = CGColorCreateCopyWithAlpha(self.overlayColor, 0.f);
    CGColorRef secondColor = CGColorCreateCopyWithAlpha(self.overlayColor, 0.4f);
    CGColorRef thirdColor = CGColorCreateCopyWithAlpha(self.overlayColor, 0.5f);
    
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorsArray[] = {
        firstColor,
        secondColor,
        thirdColor
    };
    
    CFArrayRef colors = CFArrayCreate(NULL, 
                                      (const void**)colorsArray, 
                                      sizeof(colorsArray)/sizeof(CGColorRef), 
                                      &kCFTypeArrayCallBacks);
    
    CGFloat locationList[] = {0.0,0.5,1.0};
    
    _gradientRef = CGGradientCreateWithColors(rgb, colors, locationList);
    
    CGColorRelease(firstColor);
    CGColorRelease(secondColor);
    CGColorRelease(thirdColor);
    
    CFRelease(colors);
    
    CGColorSpaceRelease(rgb);
#pragma clang diagnostic pop
}

- (void)_drawRadialGradientInRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(context);
    CGPoint center = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
    
    float startRadius = 50.0f;
    float endRadius = rect.size.height*0.66f;
    
    NSAssert(self.gradientRef != nil, @"Gradient is nil!");
    
    CGContextDrawRadialGradient(context, 
                                self.gradientRef,
                                center, 
                                startRadius, 
                                center, 
                                endRadius,
                                kCGGradientDrawsBeforeStartLocation | 
                                kCGGradientDrawsAfterEndLocation);
    
    CGContextRestoreGState(context);
}

- (void)_drawLinearOverlayInRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(context);
    
    //create copy of overlay color
    CGColorRef linearColor = CGColorCreateCopyWithAlpha(self.overlayColor, 0.3f);
    
    CGContextSetFillColorWithColor(context, linearColor);
    CGContextFillRect(context, rect);
    
    CGColorRelease(linearColor);
    
    CGContextRestoreGState(context);
}

- (void)_renderBlurInRect:(CGRect)rect {
    CGRect renderingRect = [self.window convertRect:rect fromView:self];
    UIImage *snapshot = [self.window mm_snaphotInRect:renderingRect];
    UIImage *bluredSnapshot = [snapshot mm_applyBlurWithRadius:1.f tintColor:[UIColor colorWithCGColor:_overlayColor] saturationDeltaFactor:2.0f maskImage:nil];

    [_blurImageView setImage:bluredSnapshot];
}

- (void)setOverlayMode:(MMProgressHUDWindowOverlayMode)overlayMode {
    if (_overlayMode != overlayMode) {
        _overlayMode = overlayMode;

        [_blurImageView setHidden:_overlayMode != MMProgressHUDWindowOverlayModeBlur];
    }

    [self setNeedsDisplay];
}

- (void)setOverlayColor:(CGColorRef)overlayColor {
    CGColorRelease(_overlayColor);
    _overlayColor = CGColorCreateCopy(overlayColor);

    [self _buildGradient];
    [self setNeedsDisplay];
}

- (void)dealloc {
    CGGradientRelease(_gradientRef);
    CGColorRelease(_overlayColor);
}

@end

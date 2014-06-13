//
// Created by zen on 13/06/14.
// Copyright (c) 2014 Mutual Mobile. All rights reserved.
//

#import "UIView+MMSnapshot.h"

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_7_0

@implementation UIView (MMSnapshot)

- (UIImage *)mm_snaphotInRect:(CGRect)rect {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, self.window.screen.scale);

    [self drawViewHierarchyInRect:rect afterScreenUpdates:NO];

    UIImage *snapshot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return snapshot;
}

- (UIImage *)mm_snaphot {
    return [self mm_snaphotInRect:self.bounds];
}

@end

#endif
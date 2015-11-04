//
//  CTColumnView.m
//  ThreeLineApp
//
//  Created by LiuX on 15-1-30.
//  Copyright (c) 2015年 Westwind. All rights reserved.
//

#import "CTColumnView.h"

@implementation CTColumnView

- (void)setCTFrame:(id)f{
    ctFrame = f;
}


- (void)drawRect:(CGRect)rect{
    CGContextRef context = UIGraphicsGetCurrentContext();
    // Flip the coordinate system
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CTFrameDraw((CTFrameRef)ctFrame, context);
}

@end

//
//  CTView.h
//  ThreeLineApp
//
//  Created by LiuX on 15-1-30.
//  Copyright (c) 2015年 Westwind. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>

@interface CTView : UIView

@property (nonatomic) BOOL limitLine;
@property (strong, nonatomic) NSMutableArray* frames;
@property (nonatomic) CGSize textSize;
@property (nonatomic, strong) NSAttributedString *attString;

- (NSString *)getTruncatedStringIfNeeded:(NSAttributedString *)attString;
- (void)buildFrames;
@end

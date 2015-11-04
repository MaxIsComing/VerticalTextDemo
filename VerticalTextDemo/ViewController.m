//
//  ViewController.m
//  verticalText
//
//  Created by golven on 15/11/3.
//  Copyright © 2015年 Max. All rights reserved.
//

#import "ViewController.h"
#import "CTView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CTView *boundView = [[CTView alloc] initWithFrame:CGRectMake(0, 0, 200, 500)];
    boundView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    boundView.limitLine = YES;
    NSAttributedString *string = [[NSAttributedString alloc] initWithString:@"买陂塘、旋栽杨柳，依稀淮岸江浦。\n东皋嘉雨新痕涨，沙觜鹭来鸥聚。\n堪爱处最好是、一川夜月光流渚。\n无人独舞。\n任翠幄张天，柔茵藉地，酒尽未能去。\n青绫被，莫忆金闺故步。\n儒冠曾把身误。\n弓刀千骑成何事，荒了邵平瓜圃。\n君试觑。\n满青镜、星星鬓影今如许。\n功名浪语。便似得班超，封侯万里，归计恐迟暮。"];
    [boundView setAttString:[self buildAttrString:string.string withFont:@"Copperplate-Light" fontSize:15 lineSpace:2 fontColor:[UIColor blackColor] delLine:NO]];
    boundView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width-boundView.frame.size.width-10, 20, boundView.frame.size.width, boundView.frame.size.height);
    [self.view addSubview:boundView];
    
//        for (NSString *str in [UIFont familyNames]) {
//            for (NSString *str2 in [UIFont fontNamesForFamilyName:str]) {
//                NSLog(@"%@", str2);
//            }
//        }

}

- (NSMutableAttributedString *)buildAttrString:(NSString *)content
                                      withFont:(NSString *)fontName
                                      fontSize:(CGFloat)fontSize
                                     lineSpace:(CGFloat)lineSpace
                                     fontColor:(UIColor *)textColor
                                       delLine:(BOOL)delLine
{
    //CTFontRef fontRef = CTFontCreateWithName((CFStringRef)@"FZBWKSFW--GB1-0", 22.0f, NULL);
    CTFontRef fontRef = CTFontCreateWithName((CFStringRef)fontName, fontSize, NULL);
    
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc]
                                            initWithString:content
                                            attributes:
                                            @{
                                              //文字的方向
                                              (NSString *)kCTVerticalFormsAttributeName : @(YES),
                                              (NSString *)kCTFontAttributeName : (__bridge id)fontRef,
                                              (NSString *)kCTForegroundColorAttributeName :(id)textColor.CGColor
                                              }];
    
    //line break
    CTParagraphStyleSetting lineBreakMode;
    CTLineBreakMode lineBreak = kCTLineBreakByWordWrapping; //换行模式
    lineBreakMode.spec = kCTParagraphStyleSpecifierLineBreakMode;
    lineBreakMode.value = &lineBreak;
    lineBreakMode.valueSize = sizeof(CTLineBreakMode);
    //行间距
    CTParagraphStyleSetting LineSpacing;
    CGFloat spacing = lineSpace;  //指定间距
    LineSpacing.spec = kCTParagraphStyleSpecifierLineSpacingAdjustment;
    LineSpacing.value = &spacing;
    LineSpacing.valueSize = sizeof(CGFloat);
    
    CTParagraphStyleSetting settings[] = {lineBreakMode,LineSpacing};
    CTParagraphStyleRef paragraphStyle = CTParagraphStyleCreate(settings, 2);   //第二个参数为settings的长度
    [attString addAttribute:(NSString *)kCTParagraphStyleAttributeName
                      value:(__bridge id)paragraphStyle
                      range:NSMakeRange(0, attString.length)];
    
    if (delLine){
        NSNumber *underline = [NSNumber numberWithInt:kCTTextAlignmentCenter];
        [attString addAttribute:(id)kCTUnderlineStyleAttributeName value:underline range:NSMakeRange(0, attString.length) ];
    }
    return attString;
}

@end

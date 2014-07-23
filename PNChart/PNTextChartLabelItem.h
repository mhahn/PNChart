//
//  PNTextChartLabelItem.h
//  PNChartDemo
//
//  Created by mhahn on 7/23/14.
//  Copyright (c) 2014 kevinzhow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PNTextChartLabelItem : UIView

+ (instancetype)dataItemWithText:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment labelHeight:(float)labelHeight;

@property (nonatomic, strong) UIFont *font;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, assign) NSTextAlignment textAlignment;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, assign) float labelHeight;

@end

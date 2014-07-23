//
//  PNTextChartLabelItem.m
//  PNChartDemo
//
//  Created by mhahn on 7/23/14.
//  Copyright (c) 2014 kevinzhow. All rights reserved.
//

#import "PNTextChartLabelItem.h"

@implementation PNTextChartLabelItem

+ (instancetype)dataItemWithText:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment labelHeight:(float)labelHeight {
    
    PNTextChartLabelItem *item = [PNTextChartLabelItem new];
    item.text = text;
    item.font = font;
    item.textColor = textColor;
    item.textAlignment = textAlignment;
    item.labelHeight = labelHeight;
    return item;
    
}

@end

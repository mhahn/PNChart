//
//  PNStackedBarChartDataItem.m
//  PNChartDemo
//
//  Created by mhahn on 7/17/14.
//  Copyright (c) 2014 kevinzhow. All rights reserved.
//

#import "PNStackedBarChartDataItem.h"

@interface PNStackedBarChartDataItem()

@property (nonatomic, readwrite) CGFloat value;
@property (nonatomic, readwrite) UIColor *color;
@property (nonatomic, readwrite) CGFloat maxValue;

@end

@implementation PNStackedBarChartDataItem

+ (instancetype)dataItemWithValue:(CGFloat)value color:(UIColor *)color {
    
    PNStackedBarChartDataItem *item = [PNStackedBarChartDataItem new];
    item.value = value;
    item.color = color;
    return item;
}

@end

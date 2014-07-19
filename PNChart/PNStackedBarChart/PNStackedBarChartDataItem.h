//
//  PNStackedBarChartDataItem.h
//  PNChartDemo
//
//  Created by mhahn on 7/17/14.
//  Copyright (c) 2014 kevinzhow. All rights reserved.
//

#import <Foundation/Foundation.h>

// {"Day 1": [("Entertainment", 50), ("Food", 100)], "Day 2": [("Entertainment": 100), ("Food", 200)]}
// - maxYValue is 300 since that is the greatest some for any day, everything else should be in proportion to that value
@interface PNStackedBarChartDataItem : NSObject

+ (instancetype)dataItemWithValue:(CGFloat)value color:(UIColor*)color;

@property (nonatomic, readonly) CGFloat value;
@property (nonatomic, readonly) UIColor *color;

@end

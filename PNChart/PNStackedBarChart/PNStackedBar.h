//
//  PNStackedBar.h
//  PNChartDemo
//
//  Created by mhahn on 7/17/14.
//  Copyright (c) 2014 kevinzhow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "PNStackedBarChartDataItem.h"

@interface PNStackedBar : UIView

- (id)initWithFrame:(CGRect)frame items:(NSArray *)items withMaxValue:(float)maxValue;

@property (nonatomic, readonly) NSArray *items;
@property (nonatomic, readonly) float maxValue;

- (void)strokeBar;

@end

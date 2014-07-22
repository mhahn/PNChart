//
//  PNHorizontalStackedBar.h
//  PNChartDemo
//
//  Created by mhahn on 7/21/14.
//  Copyright (c) 2014 kevinzhow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PNStackedBarChartDataItem.h"

@interface PNHorizontalStackedBar : UIView

- (id)initWithFrame:(CGRect)frame items:(NSArray *)items withMaxValue:(float)maxValue;

@property (nonatomic, readonly) NSArray *items;

- (void)strokeBar;

@end

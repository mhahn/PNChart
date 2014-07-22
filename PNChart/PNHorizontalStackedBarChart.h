//
//  PNHorizontalStackedBarChart.h
//  PNChartDemo
//
//  Created by mhahn on 7/21/14.
//  Copyright (c) 2014 kevinzhow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PNChartDelegate.h"
#import "PNBarChart.h"

#define xLabelMargin 15
#define xLabelHeight 20

@interface PNHorizontalStackedBarChart : UIView

- (id)initWithFrame:(CGRect)frame items:(NSArray *)items;

@property (nonatomic, readonly) NSArray *items;
@property (nonatomic, strong) NSArray *xLabels;
@property (nonatomic, strong) NSMutableArray *bars;
@property (nonatomic, strong) NSMutableArray *labels;

@property (nonatomic) CGFloat xLabelWidth;

- (void)strokeChart;

/*
 chartMargin changes chart margin
 */
@property (nonatomic) CGFloat chartMargin;

/*
 showLabelDefines if the Labels should be deplay
 */
@property (nonatomic) BOOL showLabel;

/*
 showChartBorder if the chart border Line should be deplay
 */
@property (nonatomic) BOOL showChartBorder;

/*
 chartBottomLine the Line at the chart bottom
 */
@property (nonatomic) CAShapeLayer * chartBottomLine;

/*
 chartLeftLine the Line at the chart left
 */
@property (nonatomic) CAShapeLayer * chartLeftLine;

/*
 barWidth changes the width of the bar
 */
@property (nonatomic) CGFloat barWidth;

/*
 labelMarginTop changes the width of the bar
 */
@property (nonatomic) CGFloat labelMarginTop;

/*
 labelTextColor changes the bar label text color
 */
@property (nonatomic) UIColor * labelTextColor;

/*
 labelFont changes the bar label font
 */
@property (nonatomic) UIFont * labelFont;

/*
 xLabelSkip define the label skip number
 */
@property (nonatomic) NSInteger xLabelSkip;

/*
 maxValue define the max value of the chart
 */
@property (nonatomic, assign) CGFloat maxValue;

@property (nonatomic, retain) id<PNChartDelegate> delegate;

@end

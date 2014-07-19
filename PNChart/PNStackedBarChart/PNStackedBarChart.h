//
//  PNStackedBarChart.h
//  PNChartDemo
//
//  Created by mhahn on 7/17/14.
//  Copyright (c) 2014 kevinzhow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PNChartDelegate.h"
#import "PNBarChart.h"

#define xLabelMargin 15
#define yLabelMargin 15
#define yLabelHeight 11
#define xLabelHeight 20

typedef NSString *(^PNyLabelFromatter)(CGFloat yLabelValue);

@interface PNStackedBarChart : UIView

- (id)initWithFrame:(CGRect)frame itemArrays:(NSArray *)items;

@property (nonatomic, readonly) NSArray *itemArrays;
@property (nonatomic, strong) NSArray *xLabels;
@property (nonatomic, strong) NSArray *yLabels;
@property (nonatomic, strong) NSArray *yValues;
@property (nonatomic, strong) NSMutableArray *bars;

@property (nonatomic) CGFloat xLabelWidth;
@property (nonatomic) int yValueMax;

- (void)strokeChart;

/*
 chartMargin changes chart margin
 */
@property (nonatomic) CGFloat yChartLabelWidth;

/*
 yLabelFormatter will format the ylabel text
 */

@property (copy) PNyLabelFromatter yLabelFormatter;

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
 barRadius changes the bar corner radius
 */
@property (nonatomic) CGFloat barRadius;

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
 yLabelSum define the label skip number
 */
@property (nonatomic) NSInteger yLabelSum;

/*
 yMaxValue define the max value of the chart
 */
@property (nonatomic) CGFloat yMaxValue;


/*
 yMinValue define the min value of the chart
 */
@property (nonatomic) CGFloat yMinValue;

@property (nonatomic, retain) id<PNChartDelegate> delegate;

@end

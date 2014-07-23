//
//  PNTextChart.h
//  PNChartDemo
//
//  Created by mhahn on 7/23/14.
//  Copyright (c) 2014 kevinzhow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PNTextChart : UIView

- (void)strokeChart;
@property (nonatomic, strong) NSArray *topLabels;
@property (nonatomic, strong) NSArray *bottomLabels;

@property (nonatomic) CGFloat topLabelWidth;
@property (nonatomic) CGFloat bottomLabelWidth;

@end

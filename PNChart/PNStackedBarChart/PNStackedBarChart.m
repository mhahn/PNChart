//
//  PNStackedBarChart.m
//  PNChartDemo
//
//  Created by mhahn on 7/17/14.
//  Copyright (c) 2014 kevinzhow. All rights reserved.
//

#import "PNStackedBarChart.h"
#import "PNStackedBar.h"
#import "PNChartLabel.h"

@interface PNStackedBarChart()

@property (nonatomic, readwrite) NSArray *itemArrays;

@end

@implementation PNStackedBarChart

- (id)initWithFrame:(CGRect)frame itemArrays:(NSArray *)itemArrays {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.clipsToBounds   = YES;
        _showLabel           = YES;
        _labelTextColor      = [UIColor grayColor];
        _labelFont           = [UIFont systemFontOfSize:11.0f];
        _itemArrays          = [NSArray arrayWithArray:itemArrays];
        _labels              = [NSMutableArray array];
        _xLabelSkip          = 1;
        _labelMarginTop      = 0;
        _chartMargin         = 15.0;
        _barRadius           = 2.0;
        _showChartBorder     = NO;
        _yChartLabelWidth    = 18;
    }
    return self;
}

- (void)setXLabels:(NSArray *)xLabels
{
    _xLabels = xLabels;
    
    if (_showLabel) {
        _xLabelWidth = (self.frame.size.width - _chartMargin * 2) / [xLabels count];
    }
}

- (void)strokeChart {
    [self viewCleanupForCollection:self.labels];
    // Add labels
    if (self.showLabel) {
        // Add x labels
        int labelAddCount = 0;
        for (int index = 0; index < self.xLabels.count; index++) {
            labelAddCount += 1;
            
            if (labelAddCount == self.xLabelSkip) {
                NSString *labelText = _xLabels[index];
                PNChartLabel * label = [[PNChartLabel alloc] initWithFrame:CGRectZero];
                label.font = _labelFont;
                label.textColor = _labelTextColor;
                [label setTextAlignment:NSTextAlignmentCenter];
                label.text = labelText;
                [label sizeToFit];
                CGFloat labelXPosition  = (index *  _xLabelWidth + _chartMargin + _xLabelWidth /2.0 );
                
                label.center = CGPointMake(labelXPosition,
                                           self.frame.size.height - xLabelHeight - _chartMargin + label.frame.size.height /2.0 + _labelMarginTop);
                labelAddCount = 0;
                
                [_labels addObject:label];
                [self addSubview:label];
            }
        }
        
        // Add y labels
//        float yLabelSectionHeight = (self.frame.size.height - _chartMargin * 2 - xLabelHeight) / _yLabelSum;
//        
//        for (int index = 0; index < _yLabelSum; index++) {
//            
//            NSString *labelText = _yLabelFormatter((float)_yValueMax * ( (_yLabelSum - index) / (float)_yLabelSum ));
//            
//            PNChartLabel * label = [[PNChartLabel alloc] initWithFrame:CGRectMake(0,
//                                                                                  yLabelSectionHeight * index + _chartMargin - yLabelHeight/2.0,
//                                                                                  _yChartLabelWidth,
//                                                                                  yLabelHeight)];
//            label.font = _labelFont;
//            label.textColor = _labelTextColor;
//            [label setTextAlignment:NSTextAlignmentRight];
//            label.text = labelText;
//            
//            [_labels addObject:label];
//            [self addSubview:label];
//            
//        }
    }
    
    [self viewCleanupForCollection:_bars];
    
    //Add bars
    CGFloat chartCavanHeight = self.frame.size.height - _chartMargin * 2 - xLabelHeight;
    NSInteger index = 0;
    
    for (NSArray *items in self.itemArrays) {
        
        PNStackedBar *bar;
        CGFloat barWidth;
        CGFloat barXPosition;
        
        if (_barWidth) {
            barWidth = _barWidth;
            barXPosition = index *  _xLabelWidth + _chartMargin + _xLabelWidth /2.0 - _barWidth /2.0;
        }else{
            barXPosition = index *  _xLabelWidth + _chartMargin + _xLabelWidth * 0.25;
            if (_showLabel) {
                barWidth = _xLabelWidth * 0.5;
                
            }
            else {
                barWidth = _xLabelWidth * 0.6;
                
            }
        }
        bar = [[PNStackedBar alloc] initWithFrame:CGRectMake(barXPosition, self.frame.size.height - chartCavanHeight - xLabelHeight - self.chartMargin, barWidth, chartCavanHeight) items:items withMaxValue:self.yMaxValue];
        
        //Change Bar Radius
//        bar.barRadius = _barRadius;
        
        //Change Bar Background color
//        bar.backgroundColor = _barBackgroundColor;
        
        //For Click Index
        bar.tag = index;
        
        [_bars addObject:bar];
        [bar strokeBar];
        [self addSubview:bar];
        index += 1;
    }

}

- (void)viewCleanupForCollection:(NSMutableArray *)array
{
    if (array.count) {
        [array makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [array removeAllObjects];
    }
}

#pragma mark - Touch detection

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self touchPoint:touches withEvent:event];
    [super touchesBegan:touches withEvent:event];
}


- (void)touchPoint:(NSSet *)touches withEvent:(UIEvent *)event
{
    //Get the point user touched
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self];
    UIView *subview = [self hitTest:touchPoint withEvent:nil];
    
    if ([subview.superview isKindOfClass:[PNStackedBar class]] && [self.delegate respondsToSelector:@selector(userClickedOnBarCharIndex:)]) {
        [self.delegate userClickedOnBarCharIndex:subview.superview.tag];
    }
}

@end

//
//  PNHorizontalStackedBarChart.m
//  PNChartDemo
//
//  Created by mhahn on 7/21/14.
//  Copyright (c) 2014 kevinzhow. All rights reserved.
//

#import "PNHorizontalStackedBarChart.h"
#import "PNHorizontalStackedBar.h"
#import "PNChartLabel.h"

@interface PNHorizontalStackedBarChart()

@property (nonatomic, readwrite) NSArray *itemArrays;

@end

@implementation PNHorizontalStackedBarChart

- (id)initWithFrame:(CGRect)frame items:(NSArray *)items {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.clipsToBounds   = YES;
        _showLabel           = YES;
        _labelTextColor      = [UIColor grayColor];
        _labelFont           = [UIFont systemFontOfSize:11.0f];
        _items               = [NSArray arrayWithArray:items];
        _labels              = [[NSMutableArray alloc] init];
        _bars                = [[NSMutableArray alloc] init];
        _xLabelSkip          = 1;
        _labelMarginTop      = 0;
        _chartMargin         = 15.0;
        _showChartBorder     = NO;
    }
    return self;
}

- (void)setXLabels:(NSArray *)xLabels
{
    _xLabels = xLabels;

#warning going to need to figure this out dynamically
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
    }
    
    [self viewCleanupForCollection:_bars];
    
    // Add bar
    PNHorizontalStackedBar *bar = [[PNHorizontalStackedBar alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) items:self.items withMaxValue:self.maxValue];
    
    [_bars addObject:bar];
    [bar strokeBar];
    [self addSubview:bar];
    
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
    
    if ([subview.superview isKindOfClass:[PNHorizontalStackedBar class]] && [self.delegate respondsToSelector:@selector(userClickedOnBarCharIndex:)]) {
        [self.delegate userClickedOnBarCharIndex:subview.superview.tag];
    }
}

@end
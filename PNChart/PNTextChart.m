//
//  PNTextChart.m
//  PNChartDemo
//
//  Created by mhahn on 7/23/14.
//  Copyright (c) 2014 kevinzhow. All rights reserved.
//

#import "PNTextChart.h"
#import "PNBarChart.h"
#import "PNTextChartLabelItem.h"
#import "PNChartLabel.h"

@interface PNTextChart() {
    NSMutableArray *_labels;
    CGFloat _maxTopWidth;
    CGFloat _maxBottomWidth;
}

@end

@implementation PNTextChart

- (id)initWithFrame:(CGRect)frame items:(NSArray *)items {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.clipsToBounds   = YES;
        _topLabels = [[NSArray alloc] init];
        _bottomLabels = [[NSArray alloc] init];
        _labels = [[NSMutableArray alloc] init];
        _topLabelWidth = 0;
        _bottomLabelWidth = 0;
        _maxTopWidth = 0;
        _maxBottomWidth = 0;
    }
    return self;
}

- (void)viewCleanupForCollection:(NSArray *)array
{
    if (array.count) {
        NSMutableArray *mutable = [NSMutableArray arrayWithArray:array];
        [mutable makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [mutable removeAllObjects];
    }
}

- (void)strokeLabelsForChart:(NSArray *)labels labelWidth:(float)labelWidth labelsIndex:(float)labelsIndex {
    [self viewCleanupForCollection:labels];
    PNChartLabel *label;
    PNTextChartLabelItem *item;
    for (int index = 0; index < labels.count; index++) {
        item = labels[index];
        label = [[PNChartLabel alloc] initWithFrame:CGRectZero];
        if (item.font) {
            label.font = item.font;
        }
        label.textColor = item.textColor;
        [label setTextAlignment:item.textAlignment];
        label.text = item.text;
        [label sizeToFit];
        float chartMargin = 10.f;
        CGFloat labelXPosition = (index *  labelWidth + chartMargin + labelWidth /2.0 );
        CGFloat labelYPosition;
        if (labelsIndex == 1) {
            labelYPosition = (self.frame.size.height - (2 * item.labelHeight));
        } else {
            labelYPosition = (self.frame.size.height - item.labelHeight);
        }
            
        NSLog(@"labelXPosition: %f", labelXPosition);
        NSLog(@"labelYPosition: %f", labelYPosition);
        label.center = CGPointMake(labelXPosition, labelYPosition);
        [_labels addObject:label];
        [self addSubview:label];
    }
}

- (void)strokeChart {
    _maxTopWidth = MIN(self.frame.size.width/self.topLabels.count, self.topLabelWidth);
    _maxBottomWidth = MIN(self.frame.size.width/self.bottomLabels.count, self.bottomLabelWidth);
    [self strokeLabelsForChart:self.topLabels labelWidth:_maxTopWidth labelsIndex:1];
    [self strokeLabelsForChart:self.bottomLabels labelWidth:_maxBottomWidth labelsIndex:2];
}

@end

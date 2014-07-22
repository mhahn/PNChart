//
//  PNHorizontalStackedBar.m
//  PNChartDemo
//
//  Created by mhahn on 7/21/14.
//  Copyright (c) 2014 kevinzhow. All rights reserved.
//

#import "PNHorizontalStackedBar.h"

@interface PNHorizontalStackedBar()

@property (nonatomic) CGFloat total;
@property (nonatomic, readwrite) NSArray *items;
@property (nonatomic) UIView *contentView;
@property (nonatomic) CAShapeLayer *barLayer;
@property (nonatomic, assign) float maxValue;

- (void)loadDefault;

- (PNStackedBarChartDataItem *)dataItemForIndex:(NSUInteger)index;

- (CAShapeLayer *)newBarLayerWithStrokeColor:(UIColor *)strokeColor
                                       grade:(CGFloat)grade;

@end

@implementation PNHorizontalStackedBar

- (id)initWithFrame:(CGRect)frame items:(NSArray *)items withMaxValue:(float)maxValue {
    self = [super initWithFrame:frame];
    if (self) {
        _items = items;
        _maxValue = maxValue;
    }
    return self;
}

- (CAShapeLayer *)newBarLayerWithStrokeColor:(UIColor *)strokeColor grade:(CGFloat)grade {
    
    CAShapeLayer *bar = [CAShapeLayer layer];
    
    UIBezierPath *progressline = [UIBezierPath bezierPath];
    [progressline moveToPoint:CGPointMake(0, 0)];
    [progressline addLineToPoint:CGPointMake(self.frame.size.width * grade, 0)];
    [progressline setLineWidth:1.0];
    [progressline setLineCapStyle:kCGLineCapSquare];

    bar.lineCap = kCALineCapButt;
    bar.fillColor = [[UIColor whiteColor] CGColor];
    bar.lineWidth = self.frame.size.height;
    bar.strokeColor = [strokeColor CGColor];
    bar.strokeEnd = 1.0;
    bar.path = progressline.CGPath;
    return bar;
}

- (void)maskChart {
    
    CAShapeLayer *maskLayer = [self newBarLayerWithStrokeColor:[UIColor blackColor] grade:1.f];
    
    self.barLayer.mask = maskLayer;
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 1.0;
    pathAnimation.fromValue = @0.0f;
    pathAnimation.toValue = @1.0f;
    pathAnimation.delegate = self;
    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pathAnimation.removedOnCompletion = YES;
    [maskLayer addAnimation:pathAnimation forKey:@"strokeEndAnimation"];
}

- (PNStackedBarChartDataItem *)dataItemForIndex:(NSUInteger)index {
    return self.items[index];
}

- (void)loadDefault {
    
    [self.contentView removeFromSuperview];
    self.contentView = [[UIView alloc] initWithFrame:self.bounds];
    [self addSubview:self.contentView];
    
    self.barLayer = [CAShapeLayer layer];
    [self.contentView.layer addSublayer:self.barLayer];
}

- (void)strokeBar {
    [self loadDefault];
    
    NSMutableArray *layers = [[NSMutableArray alloc] init];
    PNStackedBarChartDataItem *currentItem;
    CGFloat currentTotal = 0;
    for (int i = 0; i < self.items.count; i++) {
        
        currentItem = [self dataItemForIndex:i];
        currentTotal += currentItem.value;
        
        CGFloat grade = currentTotal / self.maxValue;
        CAShapeLayer *currentBarLayer = [self newBarLayerWithStrokeColor:currentItem.color grade:grade];
        [layers addObject:currentBarLayer];
    }
    
//    // Add the layers in reverse order so the smaller layers don't get covered by the larger ones
    for (int i = (self.items.count - 1); i >= 0; i--) {
        [self.barLayer addSublayer:layers[i]];
    }
    
    [self maskChart];
    
}

@end

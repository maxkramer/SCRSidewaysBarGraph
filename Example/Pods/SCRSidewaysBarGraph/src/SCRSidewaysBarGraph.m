//
//  SCRSidewaysBarGraph.m
//  School Report
//
//  Created by Max Kramer on 19/06/2014.
//  Copyright (c) 2014 Max Kramer. All rights reserved.
//

#import "SCRSidewaysBarGraph.h"

static float horizontalOffset = 20.0f;
static float rightOffset = 20.0f;
static float barHeight = 15.0f;
static float barSpacing = 5.0f;
static float topBottomPadding = 10.0f;

@interface SCRSidewaysBarGraph ()

@property (nonatomic, strong) NSArray *observableKeyPaths;

@end

@implementation SCRSidewaysBarGraph

#pragma mark - Initializers

- (instancetype)initWithFrame:(CGRect)frame yAxisLabels:(NSArray *)yAxis xValues:(NSArray *)xValues maxXValue:(int)maxXValue showCount:(BOOL)showCount {
    if ((self = [super initWithFrame:frame])) {
        [self setYAxisLabels:yAxis];
        [self setXValues:xValues];
        [self setShowCount:showCount];
        [self setMaxXValue:maxXValue];
        self.backgroundColor = [UIColor whiteColor];
        self.barBackgroundColor = [UIColor lightGrayColor];
        self.barFillColor = [UIColor redColor];
        self.labelTextAttributes = @{NSFontAttributeName : [UIFont boldSystemFontOfSize:14.0f], NSForegroundColorAttributeName : [UIColor blackColor]};
        self.countTextAttributes = @{NSFontAttributeName : [UIFont systemFontOfSize:12.0f], NSForegroundColorAttributeName : [UIColor blackColor]};
        self.observableKeyPaths = @[@"barBackgroundColor", @"barFillColor", @"labelFont", @"labelTextAttributes", @"yAxisLabels", @"xValues", @"showCount"];
        [self.observableKeyPaths enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [self addObserver:self forKeyPath:obj options:NSKeyValueObservingOptionNew context:nil];
        }];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    return [self initWithFrame:frame yAxisLabels:nil xValues:nil maxXValue:1 showCount:NO];
}

- (id)init {
    return [self initWithFrame:CGRectZero yAxisLabels:nil xValues:nil maxXValue:1 showCount:NO];
}

#pragma mark - Class Method

+ (float)expectedHeightWithBars:(NSUInteger)noOfBars {
    return noOfBars * (barHeight + barSpacing) - barSpacing + topBottomPadding * 2;
}

#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([self.observableKeyPaths containsObject:keyPath]) {
        [self setNeedsDisplay];
    }
    else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

#pragma mark - Drawing Methods

- (void)drawYAxisLabelForTitle:(NSString *)title atIndex:(NSUInteger)idx width:(float)width barHeight:(float)barHeight andBarSpacing:(float)barSpacing {
    CGRect labelBoundingRect = [title boundingRectWithSize:CGSizeMake(width, barHeight) options:NSStringDrawingUsesLineFragmentOrigin attributes:self.labelTextAttributes context:nil];
    labelBoundingRect.origin.y = topBottomPadding + (idx * (barHeight + barSpacing)) + ((barHeight - CGRectGetHeight(labelBoundingRect)) / 2);
    [title drawInRect:labelBoundingRect withAttributes:self.labelTextAttributes];
}

- (void)drawBarAtIndex:(NSUInteger)index frame:(CGRect)rect context:(CGContextRef)context {
    CGContextSaveGState(context);
    UIBezierPath *backgroundBezierPath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:2.0f];
    [backgroundBezierPath setLineWidth:1.0f];
    [self.barBackgroundColor setFill];
    [backgroundBezierPath fill];
    
    CGRect fillRect = rect;
    fillRect.size.width = fillRect.size.width * ([self.xValues[index] doubleValue] / self.maxXValue);
    UIBezierPath *fillBezierPath = [UIBezierPath bezierPathWithRoundedRect:fillRect cornerRadius:1.0f];
    [self.barFillColor setFill];
    [fillBezierPath fill];
    CGContextRestoreGState(context);
}

- (void)drawCountLabelForIndex:(NSUInteger)index xPosition:(float)xPos maxWidth:(float)maxWidth barHeight:(float)barHeight andBarSpacing:(float)barSpacing {
    NSString *title = [self.xValues[index] stringValue];
    CGRect titleBoundingRect = [title boundingRectWithSize:CGSizeMake(maxWidth, barHeight) options:NSStringDrawingUsesLineFragmentOrigin attributes:self.countTextAttributes context:nil];
    titleBoundingRect.origin.x = xPos;
    titleBoundingRect.origin.y = topBottomPadding + index * (barHeight + barSpacing) + ((barHeight - CGRectGetHeight(titleBoundingRect)) / 2);
    [title drawInRect:titleBoundingRect withAttributes:self.countTextAttributes];
}

#pragma mark - Draw Rect

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, self.backgroundColor.CGColor);
    CGContextFillRect(context, rect);
    float xOriginGraphOffset = 0;
    if (self.yAxisLabels) {
        xOriginGraphOffset = 70.0f + horizontalOffset;
    }
    if (self.showCount) {
        rightOffset += 10.0f;
    }
    [self.yAxisLabels enumerateObjectsUsingBlock:^(NSString *label, NSUInteger idx, BOOL *stop) {
        [self drawYAxisLabelForTitle:label atIndex:idx width:xOriginGraphOffset barHeight:barHeight andBarSpacing:barSpacing];
        [self drawBarAtIndex:idx frame:CGRectMake(xOriginGraphOffset, topBottomPadding + idx * (barHeight + barSpacing), CGRectGetWidth(self.frame) - xOriginGraphOffset - rightOffset, barHeight) context:context];
        if (self.showCount) {
            [self drawCountLabelForIndex:idx xPosition:CGRectGetWidth(self.frame) - (rightOffset - 5) maxWidth:rightOffset barHeight:barHeight andBarSpacing:barSpacing];
        }
    }];
}

- (void)dealloc {
    [self.observableKeyPaths enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [self removeObserver:self forKeyPath:obj];
    }];
}

@end

//
//  SCRSidewaysBarGraph.h
//  School Report
//
//  Created by Max Kramer on 19/06/2014.
//  Copyright (c) 2014 Max Kramer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCRSidewaysBarGraph : UIView

- (instancetype)initWithFrame:(CGRect)frame yAxisLabels:(NSArray *)yAxis xValues:(NSArray *)xValues maxXValue:(int)maxXValue showCount:(BOOL)showCount labelMargin:(int)labelMargin;

+ (float)expectedHeightWithBars:(NSUInteger)noOfBars;

@property (nonatomic, strong) NSArray *yAxisLabels, *xValues;
@property (nonatomic) int maxXValue;
@property (nonatomic) BOOL showCount;
@property (nonatomic, strong) UI_APPEARANCE_SELECTOR NSDictionary *labelTextAttributes, *countTextAttributes;
@property (nonatomic, strong) UI_APPEARANCE_SELECTOR UIColor *barBackgroundColor, *barFillColor;
@property (nonatomic) int labelMargin;

@end

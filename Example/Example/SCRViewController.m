//
//  SCRViewController.m
//  Example
//
//  Created by Max Kramer on 19/06/2014.
//  Copyright (c) 2014 Max Kramer. All rights reserved.
//

#import "SCRViewController.h"
#import <SCRSidewaysBarGraph/SCRSidewaysBarGraph.h>

#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0f]

@interface SCRViewController ()

@end

@implementation SCRViewController

- (void)viewDidLoad {
    float height = [SCRSidewaysBarGraph expectedHeightWithBars:5];
    SCRSidewaysBarGraph *graph = [[SCRSidewaysBarGraph alloc] initWithFrame:CGRectMake(20, (CGRectGetHeight(self.view.frame) - height) / 2, CGRectGetWidth(self.view.frame) - 40, [SCRSidewaysBarGraph expectedHeightWithBars:5]) yAxisLabels:@[@"Excellent", @"Very Good", @"Average", @"Poor", @"Terrible"] xValues:@[@10, @5, @9, @20, @4] maxXValue:48 showCount:YES];
    graph.barFillColor = RGB(215, 35, 32);
    graph.barBackgroundColor = RGB(242, 242, 242);
    graph.labelTextAttributes = @{NSForegroundColorAttributeName : [UIColor blackColor], NSFontAttributeName : [UIFont systemFontOfSize:15.0f]};
    graph.countTextAttributes = graph.labelTextAttributes;
    [self.view addSubview:graph];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

@end
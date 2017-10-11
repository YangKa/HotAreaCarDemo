//
//  PartModel.m
//  demo
//
//  Created by 杨卡 on 2017/8/2.
//  Copyright © 2017年 yangka. All rights reserved.
//

#import "MapAreaModel.h"


@implementation MapAreaModel

- (instancetype)initWithDic:(NSDictionary*)dic{
    self = [super init];
    if (self) {
        
        self.identifier = dic[@"id"];
        self.pathString = dic[@"pathString"];
    
    }
    return self;
}


//path
- (UIBezierPath*)partPath{
    NSArray *pathList = [self.pathString componentsSeparatedByString:@","];
    if (pathList.count%2 == 1 || pathList.count == 0) {
        return nil;
    }
    
    NSMutableArray *pointList = [NSMutableArray array];
    int i = 0;
    while (i<pathList.count) {
        float x = [pathList[i] floatValue];
        float y = [pathList[i+1] floatValue];
        [pointList addObject:[NSValue valueWithCGPoint:CGPointMake(x, y)]];
        i += 2;
    }
    
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path setLineWidth:2];
    
    [path moveToPoint:[pointList.firstObject CGPointValue]];
    for (int i = 1; i<pointList.count; i++) {
        [path addLineToPoint:[pointList[i] CGPointValue]];
    }
    [path addLineToPoint:[pointList.firstObject CGPointValue]];
    
    return path;
}

- (BOOL)isContainLocation:(CGPoint)point{
    return [[self partPath] containsPoint:point];
}

//mask
- (CAShapeLayer*)partMaskLayerWithFrame:(CGRect)frame{
    CAShapeLayer *trackLayer = [CAShapeLayer new];
    trackLayer.frame = frame;
    
    trackLayer.fillColor = [UIColor colorWithWhite:1 alpha:0.3].CGColor;
    trackLayer.strokeColor = [UIColor whiteColor].CGColor;
    trackLayer.path = [self partPath].CGPath;
    
    return trackLayer;
}

@end

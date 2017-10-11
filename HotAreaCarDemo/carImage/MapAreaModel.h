//
//  PartModel.h
//  demo
//
//  Created by 杨卡 on 2017/8/2.
//  Copyright © 2017年 yangka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MapAreaModel : NSObject

@property (nonatomic, copy) NSString *identifier;

@property (nonatomic, copy)  NSString *pathString;

- (instancetype)initWithDic:(NSDictionary*)dic;

- (BOOL)isContainLocation:(CGPoint)point;

//mask
- (CAShapeLayer*)partMaskLayerWithFrame:(CGRect)frame;

@end

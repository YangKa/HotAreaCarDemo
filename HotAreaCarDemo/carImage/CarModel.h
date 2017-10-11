//
//  CarModel.h
//  demo
//
//  Created by 杨卡 on 2017/8/2.
//  Copyright © 2017年 yangka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class MapAreaModel;

@interface CarModel : NSObject

@property (nonatomic, copy) NSString *identifier;

@property (nonatomic, strong) UIImage *mapImage;

@property (nonatomic, strong) NSMutableArray <MapAreaModel *>*mapAreaList;

- (instancetype)initWithDic:(NSDictionary*)dic;

- (MapAreaModel*)getMapAreaWithPoint:(CGPoint)point;

@end

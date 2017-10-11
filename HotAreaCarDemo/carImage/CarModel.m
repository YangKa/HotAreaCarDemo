//
//  CarModel.m
//  demo
//
//  Created by 杨卡 on 2017/8/2.
//  Copyright © 2017年 yangka. All rights reserved.
//

#import "CarModel.h"
#import "MapAreaModel.h"

@implementation CarModel

- (instancetype)initWithDic:(NSDictionary*)dic{
    self = [super init];
    if (self) {
        
        self.identifier = dic[@"id"];
        self.mapImage = [UIImage imageNamed:dic[@"imageName"]];
        
        self.mapAreaList = [NSMutableArray array];
        
        NSArray *pathList  = dic[@"mapAreaList"];
        for (NSDictionary *pathDic in pathList) {
            MapAreaModel *model = [[MapAreaModel alloc] initWithDic:pathDic];
            [self.mapAreaList addObject:model];
        }
    }
    return self;
}

- (MapAreaModel*)getMapAreaWithPoint:(CGPoint)point{
	
    for (MapAreaModel *model in self.mapAreaList) {
        if ([model isContainLocation:point]) {
            return model;
        }
    }
    
    return nil;
}

@end

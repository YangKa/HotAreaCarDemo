//
//  CanvasView.m
//  demo
//
//  Created by 杨卡 on 2017/8/2.
//  Copyright © 2017年 yangka. All rights reserved.
//

#import "CanvasView.h"
#import "CarModel.h"
#import "MapAreaModel.h"


@interface CanvasView ()

@property (nonatomic, strong) UIImageView *imageView;

//全局
@property (nonatomic, strong) NSMutableSet *selectAreaList;

//单个车辆模型有效
@property (nonatomic, strong) NSMutableDictionary *selectMaskDic;

@property (nonatomic, copy) NSArray *carModelList;

@property (nonatomic, assign) NSUInteger curIndex;

@end

@implementation CanvasView

- (instancetype)initWithFrame:(CGRect)frame carModelList:(NSArray*)carModelList
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        
        
        
        _carModelList = [self transformModelWithList:carModelList];
        _curIndex = 0;
        
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 267)];
        _imageView.center = CGPointMake(self.frame.size.width/2, 150);
        _imageView.userInteractionEnabled = YES;
        [self addSubview:_imageView];
        
        [_imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOnMapImage:)]];
        
        
        UISwipeGestureRecognizer *leftSwip = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeCarCanvas:)];
        leftSwip.direction = UISwipeGestureRecognizerDirectionLeft;
        [self addGestureRecognizer:leftSwip];
        
        UISwipeGestureRecognizer *rightSwip = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeCarCanvas:)];
        rightSwip.direction = UISwipeGestureRecognizerDirectionRight;
        [self addGestureRecognizer:rightSwip];
        
        [self showCarModel];
    }
    return self;
}

- (NSArray*)transformModelWithList:(NSArray*)list{
    NSMutableArray *tempList = [NSMutableArray array];
    
    for (int i = 0; i<list.count; i++) {
        CarModel *model = [[CarModel alloc] initWithDic:list[i]];
        [tempList addObject:model];
    }
    
    return tempList.copy;
}


#pragma mark
#pragma mark exchange car canvas
- (void)swipeCarCanvas:(UISwipeGestureRecognizer*)gesture{
    if (gesture.direction == UISwipeGestureRecognizerDirectionLeft) {
        [self showNextModel];
    }
    if (gesture.direction == UISwipeGestureRecognizerDirectionRight) {
        [self showLastModel];
    }
}

- (void)showNextModel{
    self.curIndex = (self.curIndex+1)  % _carModelList.count;
    [self showCarModel];
}

- (void)showLastModel{
    self.curIndex = (self.curIndex-1 + _carModelList.count)  % _carModelList.count;
    [self showCarModel];
}

#pragma mark
#pragma mark dispaly
- (void)showCarModel{
    //清空画布
    [self clearCanvas];
    
    CarModel *carModel = [self.carModelList objectAtIndex:_curIndex];
    
	//切换图片
    self.imageView.image = carModel.mapImage;
    
    //查询全局已选热点区域。筛选出已选本区域热点
    for (MapAreaModel *mapArea in carModel.mapAreaList) {
        if ([self.selectAreaList containsObject:mapArea.identifier]) {
            [self displayMapArea:mapArea];
        }
    }
}

- (void)clearCanvas{
    for (NSString *identifier in self.selectMaskDic.allKeys) {
        [self removeMaskLayerForIdentifier:identifier];
    }
    [self.selectMaskDic removeAllObjects];
}

- (void)displayMapArea:(MapAreaModel*)mapArea{
    
    CAShapeLayer *shapLayer = [mapArea partMaskLayerWithFrame:_imageView.bounds];
    [_imageView.layer addSublayer:shapLayer];
    
    [self.selectMaskDic setObject:shapLayer forKey:mapArea.identifier];
}

- (void)removeMaskLayerForIdentifier:(NSString*)identifier{

        
        CAShapeLayer *layer = self.selectMaskDic[identifier];
        [layer removeFromSuperlayer];

}

#pragma mark
#pragma mark 点击
- (void)tapOnMapImage:(UITapGestureRecognizer*)gesture{
    CGPoint location = [gesture locationInView:gesture.view];
    
    CarModel *carModel = [self.carModelList objectAtIndex:_curIndex];
    
    MapAreaModel *mapArea = [carModel getMapAreaWithPoint:location];
    
    if (mapArea) {
        if ([self.selectAreaList containsObject:mapArea.identifier]) {
            [self.selectAreaList removeObject:mapArea.identifier];
            [self removeMaskLayerForIdentifier:mapArea.identifier];
             [self.selectMaskDic removeObjectForKey:mapArea.identifier];
        }else{
            [self.selectAreaList addObject:mapArea.identifier];
            [self displayMapArea:mapArea];
        }
        
        [self callBack];
    }
}

- (void)callBack{
    NSString *result = @"";
    for (NSString *identifier in self.selectAreaList) {
        if (result.length == 0) {
            result = [result stringByAppendingString:identifier];
        }else{
            result = [result stringByAppendingFormat:@", %@", identifier];
        }
    }
    
    if (self.SelectPartAreaBlock) {
        self.SelectPartAreaBlock(result);
    }
}

- (NSMutableSet*)selectAreaList{
    if (!_selectAreaList) {
        _selectAreaList = [NSMutableSet set];
    }
    return _selectAreaList;
}

- (NSMutableDictionary*)selectMaskDic{
    if (!_selectMaskDic) {
        _selectMaskDic = [NSMutableDictionary dictionary];
    }
    return _selectMaskDic;
}

@end

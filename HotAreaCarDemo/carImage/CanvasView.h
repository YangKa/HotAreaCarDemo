//
//  CanvasView.h
//  demo
//
//  Created by 杨卡 on 2017/8/2.
//  Copyright © 2017年 yangka. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CanvasView : UIView

@property (copy, nonatomic) void(^SelectPartAreaBlock)(NSString *result);

- (instancetype)initWithFrame:(CGRect)frame carModelList:(NSArray*)carModelList;

@end

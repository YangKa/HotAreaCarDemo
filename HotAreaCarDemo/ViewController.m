//
//  ViewController.m
//  HotAreaCarDemo
//
//  Created by qiager on 2017/10/11.
//  Copyright © 2017年 yangka. All rights reserved.
//

#import "ViewController.h"
#import "CanvasView.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [self showPloyonImage];
}

- (void)showPloyonImage{
    
    self.view.backgroundColor = [UIColor blackColor];
    NSArray *list = [self returnData];
    
    CanvasView *canvasView = [[CanvasView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-80) carModelList:list];
    canvasView.SelectPartAreaBlock = ^(NSString *result) {
        self.label.text = result;
    };
    [self.view addSubview:canvasView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(canvasView.frame), self.view.frame.size.width, self.view.frame.size.height-canvasView.frame.size.height)];
    label.textColor  = [UIColor whiteColor];
    label.numberOfLines = 0;
    [self.view addSubview:label];
    self.label = label;
    
}

- (NSArray*)returnData{
    NSArray *list = @[@{@"id":@"1",
                        @"imageName":@"1.png",
                        @"mapAreaList":@[@{@"id":@"左后门",
                                           @"pathString":@"89,73,67,78,56,99,52,117,63,147,74,149"},
                                         @{@"id":@"左前门",
                                           @"pathString":@"94,75,110,81,122,107,111,157,78,149"},
                                         @{@"id":@"前盖",
                                           @"pathString":@"133,104,136,112,169,121,194,128,267,128,269,119,231,102"},
                                         @{@"id":@"前盖窗",
                                           @"pathString":@"113,71,130,100,225,100,178,71"},
                                         @{@"id":@"前头部",
                                           @"pathString":@"146,134,153,133,163,141,274,140,277,152,276,164,169,168,154,168"}
                                         ]
                        },
                      @{@"id":@"2",
                        @"imageName":@"2.png",
                        @"mapAreaList":@[@{@"id":@"前盖",
                                           @"pathString":@"98,106,94,117,93,123,113,134,199,134,221,125,225,116,219,107"},
                                         @{@"id":@"前盖窗",
                                           @"pathString":@"122,73,102,105,218,105,201,74"},
                                         @{@"id":@"前头部",
                                           @"pathString":@"83,142,113,145,196,145,226,143,230,157,217,159,210,170,103,172,85,164"}
                                         ]
                        },
                      @{@"id":@"3",
                        @"imageName":@"3.png",
                        @"mapAreaList":@[@{@"id":@"前盖",
                                           @"pathString":@"85,102,53,122,56,132,122,132,158,124,190,107"},
                                         @{@"id":@"前盖窗",
                                           @"pathString":@"190,100,202,72,141,71,98,101"},
                                         @{@"id":@"前头部",
                                           @"pathString":@"43,137,161,142,161,156,38,155"},
                                         @{@"id":@"右前门",
                                           @"pathString":@"211,78,200,106,208,160,240,154,239,103,229,77"},
                                         @{@"id":@"右后门",
                                           @"pathString":@"236,78,244,152,256,150,264,115,254,81"}
                                         ]
                        },
                      @{@"id":@"4",
                        @"imageName":@"4.png",
                        @"mapAreaList":@[@{@"id":@"右前门",
                                           @"pathString":@"98,108,94,160,174,162,188,80,136,85"},
                                         @{@"id":@"右后门",
                                           @"pathString":@"194,80,184,162,218,161,262,106,255,81"},
                                         @{@"id":@"右后侧",
                                           @"pathString":@"258,81,264,104,232,158,240,162,258,132,285,132,300,108,278,79"}
                                         ]
                        },
                      @{@"id":@"5",
                        @"imageName":@"5.png",
                        @"mapAreaList":@[@{@"id":@"右前门",
                                           @"pathString":@"92,152,72,152,66,115,78,104,103,80,116,78"},
                                         @{@"id":@"右后门",
                                           @"pathString":@"148,76,142,104,124,130,117,152,98,155,99,118,106,97,120,74"},
                                         @{@"id":@"右后侧",
                                           @"pathString":@"154,75,167,75,166,105,146,127,125,129"},
                                         @{@"id":@"后上门",
                                           @"pathString":@"178,77,245,77,270,106,268,136,194,138,182,109"},
                                         @{@"id":@"后下门",
                                           @"pathString":@"184,133,192,141,259,140,274,128,275,152,192,160,164,155,164,138"}
                                         ]
                        },
                      @{@"id":@"6",
                        @"imageName":@"6.png",
                        @"mapAreaList":@[@{@"id":@"后上门",
                                           @"pathString":@"115,80,104,102,114,138,206,138,214,116,207,78,160,73"},
                                         @{@"id":@"后下门",
                                           @"pathString":@"102,116,107,134,120,141,203,142,214,117,230,135,229,161,156,161,116,158,95,144,94,131"}
                                         ]
                        },
                      @{@"id":@"7",
                        @"imageName":@"7.png",
                        @"mapAreaList":@[@{@"id":@"后上门",
                                           @"pathString":@"74,75,142,76,132,136,61,135,52,112"},
                                         @{@"id":@"后下门",
                                           @"pathString":@"49,124,56,137,128,140,156,134,153,157,48,155"},
                                         @{@"id":@"左后门",
                                           @"pathString":@"171,74,197,73,220,116,222,151,206,159,178,102"},
                                         @{@"id":@"左前门",
                                           @"pathString":@"206,74,235,87,248,102,258,119,257,150,228,152"},
                                         @{@"id":@"左后侧",
                                           @"pathString":@"150,74,168,70,175,102,194,124,200,148,189,129,181,132,173,133,151,104"}
                                         ]
                        },
                      @{@"id":@"8",
                        @"imageName":@"8.png",
                        @"mapAreaList":@[@{@"id":@"左后门",
                                           @"pathString":@"70,80,129,75,138,160,97,161,56,102"},
                                         @{@"id":@"左前门",
                                           @"pathString":@"136,78,144,160,224,162,224,110,186,86,164,79"},
                                         @{@"id":@"左后侧",
                                           @"pathString":@"43,75,66,79,55,102,93,158,69,134,53,129,33,133,21,106"}
                                         ]
                        }
                      ];
    return list;
}

@end

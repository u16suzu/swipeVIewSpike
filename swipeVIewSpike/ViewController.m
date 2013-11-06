//
//  ViewController.m
//  swipeVIewSpike
//
//  Created by u16suzu on 2013/11/05.
//  Copyright (c) 2013年 IGNIS LTD. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
@property (nonatomic) UIView*settingsView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UILabel *label = [[UILabel alloc]init];
    label.frame = CGRectMake(0, 0, 200, 50);
    label.center = self.view.center;
    label.text = @"View1";
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];


    self.settingsView = [[UIView alloc]initWithFrame:self.view.bounds];
    [self.settingsView setXOrigin:-(self.view.width)];
    self.settingsView.backgroundColor = [UIColor blueColor];
    self.settingsView.alpha = 0.5f;
    [self.view addSubview:self.settingsView];
    
    UILabel *label2 = [[UILabel alloc]init];
    label2.frame = CGRectMake(0, 0, 200, 50);
    label2.center = self.view.center;
    [label2 setYOrigin:50];
    label2.text = @"View2";
    label2.textAlignment = NSTextAlignmentCenter;
    [self.settingsView addSubview:label2];
    
   

    UICustomeGestureRecognizer *ges = [[UICustomeGestureRecognizer alloc]init];
    ges.customDelegate = self;
    [self.view addGestureRecognizer:ges];
}

#pragma mark - custom gesture delegate
- (void)moved:(float)distance{
    [self.settingsView setXOrigin:(self.settingsView.origin.x + distance)];
}

- (void)ended{
    float threashHold  = self.view.width/2;
    float maxLeftPoint = 0;
    float rightPoint = self.settingsView.origin.x + self.view.width;
    
    float velocity = 840;
    float minimumAnimationDuration = 0.15f;
    
    
    if( rightPoint >= threashHold ){ // open
        float distance = self.view.width-rightPoint;
        NSTimeInterval duration = MAX(distance/ABS(velocity), minimumAnimationDuration);
        
        [UIView animateWithDuration:duration
                         animations:^{
                             [self.settingsView setXOrigin:maxLeftPoint];
                         }
                         completion:^(BOOL finished){
                         }];
    } else if( rightPoint < self.view.width - threashHold ){
        float distance = self.view.width-rightPoint;
        NSTimeInterval duration = MAX(distance/ABS(velocity), minimumAnimationDuration);
    
        [UIView animateWithDuration:duration animations:^{
            [self.settingsView setXOrigin:-(self.view.width)];
        }];
    }
}



#pragma mark -

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

@end

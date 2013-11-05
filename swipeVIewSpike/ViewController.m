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

    self.settingsView = [[UIView alloc]initWithFrame:self.view.bounds];
    self.settingsView.backgroundColor = [UIColor blueColor];
    self.settingsView.alpha = 0.5f;
    [self.view addSubview:self.settingsView];


    UICustomeGestureRecognizer *ges =
      [[UICustomeGestureRecognizer alloc]initWithTarget:self action:@selector(hoge:)];
    [self.view addGestureRecognizer:ges];
    
    ges.customDelegate = self;
}

#pragma mark - custom gesture delegate
- (void)move:(float)distance{
    NSLog(@"delegate called");
    
    CGRect f = self.settingsView.frame;
    CGRect newF = CGRectMake(f.origin.x + distance, f.origin.y, f.size.width, f.size.height);
    self.settingsView.frame = newF;
}

- (void)hoge:(UICustomeGestureRecognizer*)sender{
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

@end

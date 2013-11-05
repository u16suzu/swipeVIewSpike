//
//  UICustomeGestureRecognizer.h
//  RSS
//
//  Created by u16suzu on 2013/11/05.
//  Copyright (c) 2013年 IGNIS LTD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIKit/UIGestureRecognizerSubclass.h>

@protocol customGestureDelegate <NSObject>
@required
- (void)move:(float)distance;
@end

typedef enum {
    CustomGestureRecognizerDirectionUp,  // 上
    CustomGestureRecognizerDirectionRight,  // 右
    CustomGestureRecognizerDirectionDown,  // 下
    CustomGestureRecognizerDirectionLeft,  // 左
} StrokeGestureRecognizerDirection;


@interface UICustomeGestureRecognizer : UIGestureRecognizer

@property (nonatomic, weak) id<customGestureDelegate>customDelegate;

@end

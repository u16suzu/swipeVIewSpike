//
//  UICustomeGestureRecognizer.m
//  RSS
//
//  Created by u16suzu on 2013/11/05.
//  Copyright (c) 2013年 IGNIS LTD. All rights reserved.
//

#import "UICustomeGestureRecognizer.h"

// どの方向でもない "None" が必要なため、ヘッダとは別に定義
typedef enum {
    LocalStrokeDirectionNone = -1,
    LocalStrokeDirectionUp,
    LocalStrokeDirectionRight,
    LocalStrokeDirectionDown,
    LocalStrokeDirectionLeft,
} LocalStrokeDirection;

@interface UICustomeGestureRecognizer()
@end

@implementation UICustomeGestureRecognizer
 
- (void)reset{
    [super reset];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    
    if( touches.count!=1 ){
        self.state = UIGestureRecognizerStateFailed;
        return;
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesMoved:touches withEvent:event];
    
    CGPoint nowPoint = [[touches anyObject] locationInView:self.view];
    CGPoint prevPoint = [[touches anyObject] previousLocationInView:self.view];
//    LocalStrokeDirection currentDirection;  // 前回と今回とを比較しどの方向に移動したか
    
    float xDistance = nowPoint.x - prevPoint.x;
    float yDistance = nowPoint.y - prevPoint.y;


    NSLog(@"point: %@ %@", NSStringFromCGPoint(nowPoint), NSStringFromCGPoint(prevPoint) );
    NSLog(@"dis: %lf %lf ", xDistance, yDistance);
    
    [self.customDelegate move:xDistance];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesEnded:touches withEvent:event];

    switch (self.state) {
        case UIGestureRecognizerStatePossible:
        case UIGestureRecognizerStateFailed:
            self.state = UIGestureRecognizerStateFailed;
            break;
        case UIGestureRecognizerStateBegan:
        case UIGestureRecognizerStateChanged:
            self.state = UIGestureRecognizerStateEnded;
            break;
        default:
            
            self.state = UIGestureRecognizerStateCancelled;
            break;
    }
    
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesCancelled:touches withEvent:event];
    
    self.state = UIGestureRecognizerStateFailed;
}

@end

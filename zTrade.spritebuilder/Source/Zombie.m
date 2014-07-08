//
//  Zombie.m
//  zTrade
//
//  Created by Jordan on 7/7/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Zombie.h"

@implementation Zombie {
    CCActionSequence *currentPath;
    NSMutableArray *pathPoints;
    CGPoint touchLocation;
    CGPoint targetPoint;
}

- (void)onEnter {
    [super onEnter];
    self.userInteractionEnabled = TRUE;
    pathPoints = [[NSMutableArray alloc] init];

}

- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    // interrupt previous movement sequence and empty the path point queue
    [self stopAllActions];
    [pathPoints removeAllObjects];
}

- (void)touchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
    // we want to know the location of our touch in this scene
    touchLocation = [touch locationInNode:self.parent];
    
    // convert CGPoint so that it can be stored in the path point queue
    NSValue *pointValue = [NSValue valueWithCGPoint:touchLocation];
    
    [pathPoints addObject:pointValue];
    
}

- (void)touchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    targetPoint = touchLocation;
    id moveAction = [CCActionMoveTo actionWithDuration:2 position:targetPoint];
    [self runAction:moveAction];
    
    // tell me how big the point path queue is
    CCLOG(@"%i",[pathPoints count]);
}

@end

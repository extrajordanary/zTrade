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
    CGPoint targetPoint;
}

- (void)onEnter {
    [super onEnter];
    self.userInteractionEnabled = TRUE;
}

- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
}

- (void)touchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
    // we want to know the location of our touch in this scene
    CGPoint touchLocation = [touch locationInNode:self.parent];
    targetPoint = touchLocation;
}

- (void)touchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    id moveAction = [CCActionMoveTo actionWithDuration:2 position:targetPoint];
    [self runAction:moveAction];
}

@end

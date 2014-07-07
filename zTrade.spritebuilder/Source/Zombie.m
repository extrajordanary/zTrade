//
//  Zombie.m
//  zTrade
//
//  Created by Jordan on 7/7/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Zombie.h"

@implementation Zombie

- (void)onEnter {
    self.userInteractionEnabled = TRUE;
}

- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
}

- (void)touchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
    // we want to know the location of our touch in this scene
    CGPoint touchLocation = [touch locationInNode:self.parent];
    self.position = touchLocation;
}

@end

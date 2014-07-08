//
//  Zombie.m
//  zTrade
//
//  Created by Jordan on 7/7/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Zombie.h"

@implementation Zombie
{
    CCActionSequence *currentPath;
    NSMutableArray *pathPoints;
    NSMutableArray *testPath;
    CGPoint touchLocation;
    CGPoint targetPoint;
    
    CGPoint one;
    CGPoint two;
    CGPoint three;
    CGPoint four;
    
    BOOL isFollowing;
}

- (void)onEnter
{
    [super onEnter];
    self.userInteractionEnabled = TRUE;
    pathPoints = [[NSMutableArray alloc] init];
    one = CGPointMake(50, 50);
    two = CGPointMake(100, 50);
    three = CGPointMake(100, 100);
    four = CGPointMake(50, 100);
    
    
    testPath = [[NSMutableArray alloc] init];
    [testPath addObject:[NSValue valueWithCGPoint:one]];
    [testPath addObject:[NSValue valueWithCGPoint:two]];
    [testPath addObject:[NSValue valueWithCGPoint:three]];
    [testPath addObject:[NSValue valueWithCGPoint:four]];
    [testPath addObject:[NSValue valueWithCGPoint:one]];

    
    isFollowing = false;

}

- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    // interrupt previous movement sequence and empty the path point queue
    [self stopAllActions];
    isFollowing = false;
    [pathPoints removeAllObjects];
    CCLOG(@"zombie at %f  %f",self.position.x, self.position.y);
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
    // ** this part works
//    targetPoint = touchLocation;
//    id moveAction = [CCActionMoveTo actionWithDuration:2 position:targetPoint];
//    [self runAction:moveAction];

    // this part doesn't TODO
    isFollowing = true;

    // tell me how big the point path queue is
    CCLOG(@"drawn path %i",[pathPoints count]);
    
    [self followPath:pathPoints];
//    CCLOG(@"test path %i",[testPath count]);

//    [self followPath:testPath];
    
//    [self followPath];
    
}

- (void) followPath:(NSMutableArray *)points
//- (void) followPath
{
    // need to create a CCActionSequence from the given array
//    CCArray *moveSequence = CCArray::create();
    
//    int i = 0;
//    CCLOG(@"yes");
//    while (i <= [points count]) {
//        if (i % 2 == 0) {
//            CGPoint nextPoint = [points[i] CGPointValue];
//            id moveAction = [CCActionMoveTo actionWithDuration:.5 position:nextPoint];
//            [self runAction:moveAction];
//            CCLOG(@"%i",i);
//
//        }
//        i ++;
//    }
//    while (![moveAction isDone]) {
//        CCLOG(@"moving!");
//    }
    
    id move1 = [CCActionMoveTo actionWithDuration:1 position:one];
    id move2 = [CCActionMoveTo actionWithDuration:1 position:two];
    id move3 = [CCActionMoveTo actionWithDuration:1 position:three];
    id move4 = [CCActionMoveTo actionWithDuration:1 position:four];
    id move5 = [CCActionMoveTo actionWithDuration:1 position:one];
    
//    [self runAction:move1];
//    [self runAction:move2];
//    [self runAction:move3];
//    [self runAction:move4];
//    [self runAction:move5];
    
    [self runAction:[CCActionSequence actions: move1, move2, move3, move4, move5, nil]];

//    CCActionSequence *sequence = [CCActionSequence actionWithArray:@[moveTo, mergeTile, remove]];

    CCLOG(@"done");

}


@end

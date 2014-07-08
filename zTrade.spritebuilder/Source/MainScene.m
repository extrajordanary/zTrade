//
//  MainScene.m
//  PROJECTNAME
//
//  Created by Viktor on 10/10/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "MainScene.h"

@implementation MainScene {
    CCPhysicsNode *_physicsNode;
}



- (id)init
{
    if (self = [super init])
    {
        // activate touches on this scene
        self.userInteractionEnabled = TRUE;
    }
    return self;
}

- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    // we want to know the location of our touch in this scene
    CGPoint touchLocation = [touch locationInNode:self];
    
    // create a sprite
    CCNode *zombie = [CCBReader load:@"Zombie"];
    [_physicsNode addChild:zombie];
    // place the sprite at the touch location
    zombie.position = touchLocation;
}



@end

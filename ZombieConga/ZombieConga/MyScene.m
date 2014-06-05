//
//  MyScene.m
//  ZombieConga
//
//  Created by Super User on 05.06.14.
//  Copyright (c) 2014 KAjohansen. All rights reserved.
//

#import "MyScene.h"

static const float ZOMBIE_MOVE_POINTS_PER_SEC = 120.0;

@implementation MyScene {
    SKSpriteNode *bg;
    SKSpriteNode *_zombie;
    
    CGPoint _velocity;
    
    NSTimeInterval _lastUpdateTime;
    NSTimeInterval _dt;
}

-(id)initWithSize:(CGSize)size {
    
    if (self = [super initWithSize:size]) {
        self.backgroundColor = [SKColor whiteColor];
        
        bg = [SKSpriteNode spriteNodeWithImageNamed:@"background"];
        bg.position = CGPointMake(self.size.width/2, self.size.height/2);

        _zombie = [SKSpriteNode spriteNodeWithImageNamed:@"zombie1"];
        _zombie.position = CGPointMake(100, 100);
        
        [self addChild:bg];
        [self addChild:_zombie];
    }
    
    return self;
}

#pragma mark - touch events
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInNode:self];
    
    [self moveZombieToward:touchLocation];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInNode:self];
    
    [self moveZombieToward:touchLocation];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInNode:self];
    
    [self moveZombieToward:touchLocation];
}

#pragma mark - animation loop
- (void)update:(CFTimeInterval)currentTime { // Like requestAnimationFrame
    
    [self moveSprite:_zombie velocity:_velocity];
    
    if (_lastUpdateTime) {
        _dt = currentTime - _lastUpdateTime;
    } else {
        _dt = 0;
    }
    _lastUpdateTime = currentTime;
//    NSLog(@"%0.2f milliseconds since last update", _dt * 1000);
    
    [self boundsCheckPlayer];
    [self rotateSprite:_zombie toFace:_velocity];
}

- (void)moveSprite:(SKSpriteNode *)sprite velocity:(CGPoint)velocity {
    
    CGPoint amountToMove = CGPointMake(velocity.x * _dt, velocity.y * _dt);
//    NSLog(@"Amount to move: %@", NSStringFromCGPoint(amountToMove));
    
    sprite.position = CGPointMake(sprite.position.x + amountToMove.x, sprite.position.y + amountToMove.y);
}

- (void)moveZombieToward:(CGPoint)location {
    
    CGPoint offset = CGPointMake(location.x - _zombie.position.x, location.y - _zombie.position.y);
    CGFloat length = sqrtf(offset.x * offset.x + offset.y * offset.y);
    CGPoint direction = CGPointMake(offset.x / length, offset.y / length);
    _velocity = CGPointMake(direction.x * ZOMBIE_MOVE_POINTS_PER_SEC, direction.y * ZOMBIE_MOVE_POINTS_PER_SEC);
}

- (void)boundsCheckPlayer {
    
    // 1
    CGPoint newPosition = _zombie.position; CGPoint newVelocity = _velocity;
    
    // 2
    CGPoint bottomLeft = CGPointZero;
    CGPoint topRight = CGPointMake(self.size.width, self.size.height);
    
    // 3
    if (newPosition.x <= bottomLeft.x) {
        newPosition.x = bottomLeft.x; newVelocity.x = -newVelocity.x;
    }
    
    if (newPosition.x >= topRight.x) {
        newPosition.x = topRight.x;
        newVelocity.x = -newVelocity.x;
    }
    
    if (newPosition.y <= bottomLeft.y) {
        newPosition.y = bottomLeft.y; newVelocity.y = -newVelocity.y;
    }
    
    if (newPosition.y >= topRight.y) {
        newPosition.y = topRight.y;
        newVelocity.y = -newVelocity.y;
    }
    
    // 4
    _zombie.position = newPosition;
    _velocity = newVelocity;
}

- (void)rotateSprite:(SKSpriteNode *)sprite toFace:(CGPoint)direction {
    
    sprite.zRotation = atan2f(direction.y, direction.x);
}

@end

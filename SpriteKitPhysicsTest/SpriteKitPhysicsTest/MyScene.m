//
//  MyScene.m
//  SpriteKitPhysicsTest
//
//  Created by Super User on 05.06.14.
//  Copyright (c) 2014 KAjohansen. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene {
    
    SKSpriteNode *_square;
    SKSpriteNode *_circle;
    SKSpriteNode *_triangle;
    
}

-(instancetype)initWithSize:(CGSize)size {
    
    if(self = [super initWithSize:size]) {
        // Your code goes here
        _square = [SKSpriteNode spriteNodeWithImageNamed:@"square"];
        _square.position = CGPointMake(self.size.width * 0.25, self.size.height * 0.50);
        
        [self addChild:_square];
        
        _circle = [SKSpriteNode spriteNodeWithImageNamed:@"circle"];
        _circle.position = CGPointMake(self.size.width * 0.50, self.size.height * 0.50);
        _circle.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:_circle.size.width/2];
        
        [self addChild:_circle];
        
        _triangle = [SKSpriteNode spriteNodeWithImageNamed:@"triangle"];
        _triangle.position = CGPointMake(self.size.width * 0.75, self.size.height * 0.50);
                                         
        [self addChild:_triangle];
    
    }
    
    return self;
}

@end

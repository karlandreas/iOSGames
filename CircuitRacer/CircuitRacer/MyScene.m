//
//  MyScene.m
//  CircuitRacer
//
//  Created by Super User on 05.06.14.
//  Copyright (c) 2014 KAjohansen. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene {
    
    CRCarType _carType;
    CRLevelType _levelType;
    
    NSTimeInterval _timeInSeconds;
    int _noOfLaps;
    
}

- (id)initWithSize:(CGSize)size carType:(CRCarType)carType level:(CRLevelType)levelType {
    
    if (self = [super initWithSize:size]) {
        _carType = carType; _levelType = levelType; [self initializeGame];
    }
    
    return self;
}

- (void)initializeGame {
    
    [self loadLevel];
    
    SKSpriteNode *track = [SKSpriteNode spriteNodeWithImageNamed: [NSString stringWithFormat:@"track_%i", _levelType]];
    track.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    
    [self addChild:track];
}

- (void)loadLevel {
    
    NSString *filePath = [NSBundle.mainBundle pathForResource:@"LevelDetails" ofType:@"plist"];
    NSArray *level = [NSArray arrayWithContentsOfFile:filePath];
    NSNumber *timeInSeconds = level[_levelType-1][@"time"];
    _timeInSeconds = [timeInSeconds doubleValue];
    NSNumber *laps = level[_levelType-1][@"laps"];
    _noOfLaps = [laps intValue];
    
}


@end

//
//  MyScene.m
//  PestControl
//
//  Created by Super User on 05.06.14.
//  Copyright (c) 2014 KAjohansen. All rights reserved.
//

#import "MyScene.h"
#import "TileMapLayer.h"

@implementation MyScene

- (id)initWithSize:(CGSize)size {
    
    if (self = [super initWithSize:size]) {
        
        [self addChild:[self createScenery]];
        
        NSLog(@"Size: %@", NSStringFromCGSize(self.size));
    }
    
    return self;
}

- (TileMapLayer *)createScenery {
    return [[TileMapLayer alloc]
            initWithAtlasNamed:@"scenery"
            tileSize:CGSizeMake(32, 32)
            grid:@[@"xxxxxxxxxxxxxxxxxx",
                   @"xoooooooooooooooox",
                   @"xoooooooooooooooox",
                   @"xoooooooooooooooox",
                   @"xoooooooooooooooox",
                   @"xoooooooooxoooooox",
                   @"xoooooooooxoooooox",
                   @"xoooooxxxxxoooooox",
                   @"xoooooxoooooooooox",
                   @"xxxxxxxxxxxxxxxxxx",]];
}

- (void)didChangeSize:(CGSize)oldSize {
    
    NSLog(@"Changed size: %@", NSStringFromCGSize(self.size));
}


@end

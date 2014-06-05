//
//  TileMapLayer.h
//  PestControl
//
//  Created by Super User on 05.06.14.
//  Copyright (c) 2014 KAjohansen. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface TileMapLayer : SKNode

@property (readonly,nonatomic) CGSize tileSize;

- (instancetype)initWithAtlasNamed:(NSString *)atlasName tileSize:(CGSize)tileSize grid:(NSArray *)grid;

@end

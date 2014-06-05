//
//  ViewController.m
//  CircuitRacer
//
//  Created by Super User on 05.06.14.
//  Copyright (c) 2014 KAjohansen. All rights reserved.
//

#import "ViewController.h"
#import "MyScene.h"

@implementation ViewController

- (void)viewWillLayoutSubviews {
    
    [super viewWillLayoutSubviews];
    
    SKView *skView = (SKView *)self.view;
    if (!skView.scene) {
        MyScene *scene = [[MyScene alloc]initWithSize:skView.bounds.size
                                              carType:CRYellowCar
                                                level:CRLevelEasy];
        
        scene.scaleMode = SKSceneScaleModeAspectFill;
        [skView presentScene:scene];
    }
}

@end

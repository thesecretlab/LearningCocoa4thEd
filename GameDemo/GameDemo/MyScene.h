//
//  MyScene.h
//  GameDemo
//
//	Created for “Learning Cocoa with Objective-C Third Edition”
//	Copyright (c) 2012-2013 the authors of the book. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface MyScene : SKScene
@property (nonatomic,strong) SKSpriteNode *ship;
@property NSTimeInterval lastSpawnInterval;
@property NSTimeInterval lastUpdateInterval;

@end

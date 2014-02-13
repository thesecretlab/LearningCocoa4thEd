//
//  MyScene.m
//  GameDemo
//
//	Created for “Learning Cocoa with Objective-C Third Edition”
//	Copyright (c) 2012-2013 the authors of the book. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene

-(id)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size])
	{
        self.backgroundColor = [SKColor blackColor];
        
		// adding a ship at to the centre
		_ship = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
		_ship.size = CGSizeMake(_ship.size.width/4, _ship.size.height/4);
		_ship.position = CGPointMake(self.size.width/2, self.size.height/2);
		
		//[self addChild:_ship];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    for (UITouch *touch in touches)
	{
		CGPoint location = [touch locationInNode:self];
		
		CGFloat dx = location.x - _ship.position.x;
		CGFloat dy = _ship.position.y - location.y;
		CGFloat theta = atan2f(dx, dy);
		theta += M_PI;
		
		SKAction *rotateToTap = [SKAction rotateToAngle:theta duration:0.5 shortestUnitArc:YES];
		SKAction *moveToTap = [SKAction moveTo:location duration:0.5];
		[_ship runAction:[SKAction sequence:@[rotateToTap,moveToTap]]];
    }
}

-(void)update:(CFTimeInterval)currentTime
{
	CFTimeInterval deltaTime = currentTime - self.lastUpdateInterval;
	self.lastUpdateInterval = currentTime;
	
	// if more than a second has passed
	if (deltaTime > 1)
	{
		deltaTime = 1 / 60.0;
		self.lastUpdateInterval = currentTime;
	}
	
	self.lastSpawnInterval += deltaTime;
	if (self.lastSpawnInterval > 0.5)
	{
		self.lastSpawnInterval = 0;
		SKSpriteNode *ship = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
		ship.size = CGSizeMake(_ship.size.width/4, _ship.size.height/4);
		
		// spawning a ship randomnly along the bottom of the screen
		CGFloat x = arc4random_uniform(self.size.width) + ship.size.width/2;
		ship.position = CGPointMake(x, 0);
		[self addChild:ship];
		NSLog(@"adding ship to:%f,%f",x,self.size.height + ship.size.height/2);
		
		// move the ship across space into the distance
		SKAction *moveShip = [SKAction moveToY:self.size.height + ship.size.height duration:2];
		SKAction *removeShip = [SKAction removeFromParent];
		[ship runAction:[SKAction sequence:@[moveShip,removeShip]]];
	}
}

@end

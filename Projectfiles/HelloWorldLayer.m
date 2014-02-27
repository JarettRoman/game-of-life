/*
 * Kobold2D™ --- http://www.kobold2d.org
 *
 * Copyright (c) 2010-2011 Steffen Itterheim. 
 * Released under MIT License in Germany (LICENSE-Kobold2D.txt).
 */

#import "HelloWorldLayer.h"

@interface HelloWorldLayer (PrivateMethods)
@end

@implementation HelloWorldLayer


NSMutableArray* grid = [[NSMutableArray alloc] init];
NSMutableArray* numNeighbors = [[NSMutableArray alloc] init];

#define Y_OFF_SET 21;
#define WIDTH_WINDOW 320;
#define HEIGHT_WINDOW 480;
#define CELL_WIDTH 20;
#define WIDTH_GAME = WIDTH_WINDOW;
#define HEIGHT_GAME = HEIGHT_WINDOW;
#define NUM_ROWS = HEIGHT_GAME / CELL_WIDTH;
#define NUM_COLUMNS = WIDTH_GAME / CELL_WIDTH;
BOOL done = true;
#define DELAY_IN_SECONDS 0.15;
float priorX = 500;
float priorY = 500;




-(id) init
{
	if ((self = [super init]))
	{
        //create a 2d array with given dimensions
        for(int row = 0; row < NUM_ROWS; row ++)
        {
            NSMutableArray* gridSubArr = [[NSMutableArray alloc] init];
            for(int col = 0; col < NUM_COLUMNS; col ++)
            {
                NSNumber *gridItem  = @0; //0 = dead, 1 = alive
                
                [gridSubArr addObject:gridItem];
                
            }
            [grid addObject:gridSubArr];
        }
        
        //create a 2d array to store the number of neighbors each cell has
        for(int row = 0; row < NUM_ROWS; row ++)
        {
            NSMutableArray* numSubArr = [[NSMutableArray alloc] init];
            for(int col = 0; col < NUM_COLUMNS; col ++)
            {
                NSNumber *numItem = @0;
                
                [numSubArr addObject:numItem];  //0 = dead, 1 = alive
            }
            [numNeighbors addObject:numSubArr]
        }
	}

	return self;
}

-(void) draw
{
    //draw board rectangle
    ccColor4f boardColor = cc4f(0,0,0,0);
    CGPoint boardOrigin = ccp(0, Y_OFF_SET);
    CGPoint boardEnding = ccp(WIDTH_GAME, HEIGHT_GAME);
    ccDrawSolidRect(boardOrigin, boardEnding, boardColor);
    
    //draw row lines
    ccDrawColor4B(100, 0, 255, 255)
    
    for(int row = 0; row < HEIGHT_GAME; row += CELL_WIDTH)
    {
        CGPoint lineOrigin = ccp(0, row + Y_OFF_SET);
        CGPoint lineEnding = ccp(WIDTH_GAME, row + Y_OFF_SET);
    }
}

@end

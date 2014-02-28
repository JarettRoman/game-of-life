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


NSMutableArray* grid;
NSMutableArray* numNeighbors;

#define Y_OFF_SET 21
#define WIDTH_WINDOW 320
#define HEIGHT_WINDOW 480
#define CELL_WIDTH 20
#define WIDTH_GAME WIDTH_WINDOW
#define HEIGHT_GAME (HEIGHT_WINDOW - 60)
#define NUM_ROWS (HEIGHT_GAME / CELL_WIDTH)
#define NUM_COLUMNS (WIDTH_GAME / CELL_WIDTH)
bool done = true;
#define DELAY_IN_SECONDS 0.15
float priorX = 500;
float priorY = 500;



-(id) init
{
	if ((self = [super init]))
	{
        //create a 2d array with given dimensions
        grid = [[NSMutableArray alloc] init];
        numNeighbors = [[NSMutableArray alloc] init];

        for(int row = 0; row < NUM_ROWS; row++)
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
            [numNeighbors addObject:numSubArr];
        }
	}

	return self;
}

-(void) draw
{
    //draw board rectangle
    ccColor4F boardColor = ccc4f(255, 255, 255, 0);
    CGPoint boardOrigin = ccp(0, Y_OFF_SET);
    CGPoint boardEnding = ccp(WIDTH_GAME, HEIGHT_GAME);
    ccDrawSolidRect(boardOrigin, boardEnding, boardColor);
    
    //draw row lines
    ccDrawColor4B(100, 0, 255, 255);
    
    for(int row = 0; row < HEIGHT_GAME; row += CELL_WIDTH)
    {
        CGPoint rowLineOrigin = ccp(0, row + Y_OFF_SET);
        CGPoint rowLineEnding = ccp(WIDTH_GAME, row + Y_OFF_SET);
        ccDrawLine(rowLineOrigin, rowLineEnding);
    }
    
    //draw column lines
    for(int col=0; col <= WIDTH_GAME; col += CELL_WIDTH)
    {
        CGPoint colLineOrigin = ccp(col, 0 + Y_OFF_SET);
        CGPoint colLineEnding = ccp(col, HEIGHT_GAME + Y_OFF_SET);
        ccDrawLine(colLineOrigin, colLineEnding);
    }
    
    //make array and display match
    NSMutableArray* selectedRow = [[NSMutableArray alloc] init];
    
    for(int row = 0; row < NUM_ROWS; row++)
    {
        for(int col = 0; col < NUM_COLUMNS; col++)
        {
            
            int num = [[[grid objectAtIndex: row] objectAtIndex:col] integerValue];
            
            if(num == 1)
            {
                ccColor4F fillColor = ccc4f(100, 0, 255, 255);
                CGPoint fillOrigin = ccp(col * CELL_WIDTH, row * CELL_WIDTH + Y_OFF_SET);
                CGPoint fillEnding = ccp(CELL_WIDTH, CELL_WIDTH);
                ccDrawSolidRect(fillOrigin, fillEnding, fillColor);
            }
            //[rowArray objectAtIndex:row];
            //[colNumber objectAtIndex:col];
            //int x = [colNumber integerValue];
        }
    }
    
    //draw button
    ccColor4F buttonColor = ccc4f(150, 0, 255, 255);
    CGPoint buttonOrigin = ccp(WIDTH_WINDOW / 2, HEIGHT_GAME + Y_OFF_SET);
    CGPoint buttonEnding = ccp(WIDTH_WINDOW / 2, HEIGHT_WINDOW - HEIGHT_GAME);
    ccDrawSolidRect(buttonOrigin, buttonEnding, buttonColor);
    
    //draw clear button
    ccColor4F clearColor = ccc4f(50, 0, 255, 255);
    CGPoint clearOrigin = ccp(0, HEIGHT_GAME + Y_OFF_SET);
    CGPoint clearEnding = ccp(WIDTH_WINDOW / 2, HEIGHT_WINDOW - HEIGHT_GAME);
    
}

@end

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

-(id) init
{
	if ((self = [super init]))
	{
		//create a 2d array with given dimensions
        NSMutableArray* grid = [[NSMutableArray alloc] init];
        
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
        NSMutableArray *numNeighbors = [[NSMutableArray alloc] init];
        
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

@end

//
//  Card.m
//  Matchismo
//
//  Created by Joseph Malandruccolo on 2/11/13.
//  Copyright (c) 2013 Joseph Malandruccolo. All rights reserved.
//

#import "Card.h"

@implementation Card


//##########################################################################
// *   @method          match:...
// *   @abstract        method that returns 1 on a match, 0 otherwise
// *   @description     if two cards have the same contents, then they match
//##########################################################################
-(int)match:(NSArray *)otherCards
{
    int score = 0;
    
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
        }//end if
    }//end for
    
    return score;
}

@end

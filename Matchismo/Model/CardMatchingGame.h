//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Joseph Malandruccolo on 2/16/13.
//  Copyright (c) 2013 Joseph Malandruccolo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

//designated initializer
-(id)initWithCardCount: (NSUInteger)cardCount
             usingDeck:(Deck *)deck;


-(void)flipCardAtIndex: (NSUInteger)index;

-(Card *)cardAtIndex: (NSUInteger) index;

@property (readonly, nonatomic) int score;

@end

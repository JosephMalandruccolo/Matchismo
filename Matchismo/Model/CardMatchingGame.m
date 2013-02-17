//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Joseph Malandruccolo on 2/16/13.
//  Copyright (c) 2013 Joseph Malandruccolo. All rights reserved.
//

#import "CardMatchingGame.h"



@interface CardMatchingGame ()

@property (strong, nonatomic) NSMutableArray *cards; //of Cards
@property (readwrite, nonatomic) int score;

@end


@implementation CardMatchingGame


//##########################################################################
// *   @method          cards
// *   @abstract        getter for cards
// *   @description     don't instantiate cards until we actually call the getter
//##########################################################################
-(NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}


//##########################################################################
// *   @method          initWithCardCount:
// *   @abstract        designated initializer
// *   @description     place cards in an NSMutable array, protecting against insufficiently large decks
//##########################################################################
-(id)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            //the if block protects the initializer from insufficiently large decks
            //by convention, nil is returned
            if (!card) {
                self = nil;
                break;
            }
            //if we are able to create a card from the deck, assign the card at index i to the random card
            else {
                self.cards[i] = card;
            }//end if-else
        }//end for
    }//end if
    
    return self;
}


//##########################################################################
// *   @method          cardAtIndex:...
// *   @abstract        returns the card at a given index, nil the index requested is out of bounds
// *   @description
//##########################################################################
-(Card *)cardAtIndex:(NSUInteger)index
{
    return (index < self.cards.count) ? self.cards[index] : nil;
}



//##########################################################################
// *   @method          flipCardAtIndex:...
// *   @abstract        model method to flip card at index
// *   @description     returns a NSString describing the result
//##########################################################################
#define MATCH_BONUS 4
#define MISMATCH_PENALTY 2
#define FLIP_COST 1

-(NSString *)flipCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    NSString *result = @"Keep flipping!";
    
    if (!card.isUnplayable) {
        if (!card.isFaceUp) {
            for (Card *otherCard in self.cards) {
                if (otherCard.isFaceUp && !otherCard.isUnplayable) {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        otherCard.unplayable = YES;
                        card.unplayable = YES;
                        self.score += matchScore * MATCH_BONUS;
                        result = [NSString stringWithFormat:@"Matched %@ & %@\n+%d points!", card.contents, otherCard.contents, matchScore * MATCH_BONUS];
                    }
                    else {
                        otherCard.faceUp = NO;
                        self.score -= MISMATCH_PENALTY;
                        result = [NSString stringWithFormat:@"%@ & %@ don't match!\n-%d point penalty!", card.contents, otherCard.contents, MISMATCH_PENALTY];
                    }//end if-else
                    break;
                }//end if
            }//end for
            self.score -= FLIP_COST;
        }//end if
        card.faceUp = !card.isFaceUp;
    }//end if
    
    return result;
    
}


@end


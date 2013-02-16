//
//  PlayingCard.m
//  Matchismo
//
//  Created by Joseph Malandruccolo on 2/15/13.
//  Copyright (c) 2013 Joseph Malandruccolo. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

-(NSString *)contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings [self.rank] stringByAppendingString:self.suit];
}

@synthesize suit = _suit;   //because we provide both a getter and a setter



//##########################################################################
// *   lists of suits and ranks
//##########################################################################
+(NSArray *)validSuits
{
    return @[@"♥", @"♦", @"♣", @"♠"];
}


+(NSArray *)rankStrings
{
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];

}

+(NSInteger)maxRank
{
    return [self rankStrings].count - 1;
}


//##########################################################################
// *   suit getters and setters
//##########################################################################
-(void)setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

-(NSString *)suit
{
    return _suit ? _suit : @"?";
}


//##########################################################################
// *   rank setter
//##########################################################################
-(void)setRank:(NSInteger)rank
{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

@end

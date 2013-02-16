//
//  PlayingCard.h
//  Matchismo
//
//  Created by Joseph Malandruccolo on 2/15/13.
//  Copyright (c) 2013 Joseph Malandruccolo. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSInteger rank;

+(NSArray *)validSuits;
+(NSInteger)maxRank;

@end

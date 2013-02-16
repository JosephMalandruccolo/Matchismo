//
//  Deck.h
//  Matchismo
//
//  Created by Joseph Malandruccolo on 2/11/13.
//  Copyright (c) 2013 Joseph Malandruccolo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

-(void)addCard:(Card *)card atTop:(BOOL)atTop;

-(Card *)drawRandomCard;


@end

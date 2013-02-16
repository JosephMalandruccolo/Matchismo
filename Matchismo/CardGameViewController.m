//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Joseph Malandruccolo on 2/11/13.
//  Copyright (c) 2013 Joseph Malandruccolo. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) Deck *deck;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@end

@implementation CardGameViewController

-(Deck *)deck
{
    NSLog(@"deck called");
    if (!_deck) _deck = [[PlayingCardDeck alloc] init];
    return _deck;
}


-(void)setCardButtons:(NSArray *)cardButtons
{
    NSLog(@"setCardButtons called");
    _cardButtons = cardButtons;
    for (UIButton *cardButton in cardButtons) {
        Card *card = [self.deck drawRandomCard];
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
    }
    NSLog(@"setCardButtons finished");
}


- (void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
    NSLog(@"Flips updated to: %d", self.flipCount);
}


//##########################################################################
// *   @method          flipCard:
// *   @abstract        sets the card's selected property to the opposite of its current state
//                      increments the flip count
// *   @description
//##########################################################################
- (IBAction)flipCard:(UIButton *)sender
{
    sender.selected = !sender.isSelected;
    self.flipCount++;
}



@end

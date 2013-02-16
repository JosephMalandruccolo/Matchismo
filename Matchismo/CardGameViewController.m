//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Joseph Malandruccolo on 2/11/13.
//  Copyright (c) 2013 Joseph Malandruccolo. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@end

@implementation CardGameViewController



//##########################################################################
// *   @method          game:...
// *   @abstract        lazy instantiation of the game
// *   @description
//##########################################################################
-(CardMatchingGame *)game
{
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:self.cardButtons.count
                                                  usingDeck:[[PlayingCardDeck alloc] init]];
    return _game;
    
}


//##########################################################################
// *   @method      updateUI
// *   @abstract    updates each card on the UI and the score label, flips is updated live, on a flip
// *   @description
//##########################################################################
-(void)updateUI
{
    //cycle through the cards,updating as necessary
    for (UIButton *cardButton in self.cardButtons) {
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        
        //necessary to set this property for the combination of states below
        [cardButton setTitle:card.contents forState:UIControlStateSelected | UIControlStateDisabled];
        
        cardButton.selected = card.isFaceUp;
        //make the card untappable if it is unplayable
        cardButton.enabled = !card.isUnplayable;
        
        //change the @alpha property to increase transparency if the card is unplayable
        cardButton.alpha = card.isUnplayable ? 0.3 : 1.0;
    }//end for
    
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
}





//##########################################################################
// *   @method          setCardButtons:...
// *   @abstract        this is the setter for the cardButtons property, called when the app runs
// *   @description     assign random cards from a deck to the view buttons
//##########################################################################
-(void)setCardButtons:(NSArray *)cardButtons
{
    NSLog(@"setCardButtons called");
    _cardButtons = cardButtons;
}


- (void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
    NSLog(@"Flips updated to: %d", self.flipCount);
}


//##########################################################################
// *   @method          flipCard:
// *   @abstract        use the model to flip cards
// *                    increments the flip count
// *                    update the view
// *   @description
//##########################################################################
- (IBAction)flipCard:(UIButton *)sender
{
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    self.flipCount++;
    [self updateUI];
}



@end

#import <Specta/Specta.h>
#define EXP_SHORTHAND
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import "DBCard.h"
#import "DBCardsFixture.h"

@interface DBCard ()
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end

SpecBegin(DBCard)

describe(@"DBCard", ^{
    __block DBCard *card;
    __block NSArray *cards;
    
    beforeEach(^{
        cards = [DBCardsFixture cardsFixture];
    });
    
    describe(@"properties", ^{
        beforeEach(^{
            card = [[DBCard alloc] initWithDictionary:cards.lastObject];
        });
        
        it(@"has the correct name", ^{
            expect(card.name).to.equal(@"Balefire Liege");
        });
        
        it(@"has the correct id", ^{
            expect(card.identifier).to.equal(@"balefire-liege");
        });
        
        it(@"has the correct types", ^{
            expect(card.types).to.equal(@[@"creature"]);
        });
        
        it(@"has the correct subtypes", ^{
            expect(card.subtypes).to.equal(@[@"horror", @"spirit"]);
        });

        it(@"has the correct colors", ^{
            expect(card.colors).to.equal(@[@"red", @"white"]);
        });
        
        it(@"has the correct converted mana cost", ^{
            expect(card.convertedManaCost).to.equal(@5);
        });
        
        it(@"has the correct mana cost", ^{
            expect(card.manaCost).to.equal(@"{2}{R/W}{R/W}{R/W}");
        });

        it(@"has the correct text", ^{
            expect(card.text).to.equal(@"Other red creatures you control get +1/+1.\nOther white creatures you control get +1/+1.\nWhenever you cast a red spell, Balefire Liege deals 3 damage to target player.\nWhenever you cast a white spell, you gain 3 life.");
        });

        it(@"has the correct power", ^{
            expect(card.power).to.equal(@"2");
        });
        
        it(@"has the correct toughness", ^{
            expect(card.toughness).to.equal(@"4");
        });

        it(@"has the correct number of editions", ^{
            expect(card.editions.count).to.equal(2);
        });
    });
    
    describe(@"isEqual:", ^{
        __block DBCard *card1, *card2, *card3;
        
        beforeEach(^{
            card1 = [[DBCard alloc] initWithDictionary:cards.firstObject];
            card2 = [[DBCard alloc] initWithDictionary:cards.lastObject];
            card3 = [[DBCard alloc] initWithDictionary:cards.lastObject];
        });
        
        it(@"returns FALSE when comparing cards 1 and 2", ^{
            expect([card1 isEqual:card2]).to.beFalsy();
        });
        
        it(@"returns TRUE when comparing cards 2 and 3", ^{
            expect([card2 isEqual:card3]).to.beTruthy();
        });
    });
});

SpecEnd

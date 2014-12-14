#import <Specta/Specta.h>
#define EXP_SHORTHAND
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import "DBCardEdition.h"
#import "DBCardPrice.h"
#import "DBFixture.h"

@interface DBCardEdition ()
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end

SpecBegin(DBCardEdition)

describe(@"DBCardEdition", ^{
    __block DBCardEdition *edition;
    __block NSArray *cards;

    context(@"complete data", ^{
        beforeEach(^{
            cards = [DBFixture fixtureFromJSONFile:@"fixture_cards"];
            NSArray *editions = cards.firstObject[@"editions"];
            
            edition = [[DBCardEdition alloc] initWithDictionary:editions.firstObject];
        });
        
        it(@"has the correct set name", ^{
            expect(edition.set).to.equal(@"Odyssey");
        });
        
        it(@"has the correct set id", ^{
            expect(edition.setID).to.equal(@"ODY");
        });
        
        it(@"has the correct rarity", ^{
            expect(edition.rarity).to.equal(@"rare");
        });
        
        it(@"has the correct artist", ^{
            expect(edition.artist).to.equal(@"Mark Tedin");
        });
        
        it(@"has the correct multiverse ID", ^{
            expect(edition.multiverseID).to.equal(@29965);
        });
        
        it(@"has the correct flavor", ^{
            expect(edition.flavor).to.equal(@"\"I'm not sure which impresses me most, its thoroughness or its intensity.\"\n—Matoc, lavamancer");
        });
        
        it(@"has the correct number", ^{
            expect(edition.number).to.equal(@"174");
        });
        
        it(@"has the correct layout", ^{
            expect(edition.layout).to.equal(@"normal");
        });
        
        it(@"has the correct price", ^{
            expect(edition.price).notTo.beNil();
        });
        
        it(@"has the correct image URL", ^{
            NSURL *expectedURL = [NSURL URLWithString:@"https://image.deckbrew.com/mtg/multiverseid/29965.jpg"];
            expect(edition.imageURL).to.equal(expectedURL);
        });
    });

    context(@"incomplete data", ^{
        beforeEach(^{
            cards = [DBFixture fixtureFromJSONFile:@"fixture_cards"];
            NSArray *editions = cards.lastObject[@"editions"];
            
            edition = [[DBCardEdition alloc] initWithDictionary:editions.firstObject];
        });
        
        it(@"doesn't have price", ^{
            expect(edition.price).to.beNil();
        });
    });
});

SpecEnd

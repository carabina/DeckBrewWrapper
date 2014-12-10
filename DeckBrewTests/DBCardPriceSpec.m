#import <Specta/Specta.h>
#define EXP_SHORTHAND
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import "DBCardPrice.h"
#import "DBCardEdition.h"
#import "DBCardsFixture.h"

@interface DBCardPrice ()
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end

SpecBegin(DBCardPrice)

describe(@"DBCardPrice", ^{
    __block DBCardPrice *price;
    __block NSArray *cards;
    __block NSArray *editions;
    __block NSDictionary *edition;
    
    context(@"complete data", ^{
        beforeEach(^{
            cards = [DBCardsFixture cardsFixture];
            editions = cards.firstObject[@"editions"];
            edition = editions.firstObject;
            
            price = [[DBCardPrice alloc] initWithDictionary:edition[@"price"]];
        });
        
        it(@"has the correct low price", ^{
            expect(price.low).to.equal(89);
        });

        it(@"has the correct low average", ^{
            expect(price.average).to.equal(154);
        });

        it(@"has the correct low high", ^{
            expect(price.high).to.equal(198);
        });
    });
    
    context(@"incomplete data", ^{
        beforeEach(^{
            cards = [DBCardsFixture cardsFixture];
            editions = cards.lastObject[@"editions"];
            edition = editions.lastObject;
            
            price = [[DBCardPrice alloc] initWithDictionary:edition[@"price"]];
        });
        
        it(@"has the correct low price", ^{
            expect(price.low).to.equal(0);
        });
        
        it(@"has the correct low average", ^{
            expect(price.average).to.equal(154);
        });
        
        it(@"has the correct low high", ^{
            expect(price.high).to.equal(0);
        });
    });
    
    context(@"inexistent data", ^{
        beforeEach(^{
            cards = [DBCardsFixture cardsFixture];
            editions = cards.lastObject[@"editions"];
            edition = editions.firstObject;
            
            price = [[DBCardPrice alloc] initWithDictionary:edition[@"price"]];
        });
        
        it(@"has the correct low price", ^{
            expect(price.low).to.equal(0);
        });
        
        it(@"has the correct low average", ^{
            expect(price.average).to.equal(0);
        });
        
        it(@"has the correct low high", ^{
            expect(price.high).to.equal(0);
        });
    });
    
    describe(@"isEqual:", ^{
        __block DBCardPrice *cardPrice1, *cardPrice2, *cardPrice3;
        __block NSDictionary *edition1Dict, *edition2Dict, *edition3Dict;
        
        beforeEach(^{
            cards = [DBCardsFixture cardsFixture];

            edition1Dict = ({
                NSArray *editions = cards.firstObject[@"editions"];
                editions.firstObject[@"price"];
            });
            
            edition2Dict = ({
                NSArray *editions = cards.lastObject[@"editions"];
                editions.firstObject[@"price"];
            });
            
            edition3Dict = ({
                NSArray *editions = cards.lastObject[@"editions"];
                editions.lastObject[@"price"];
            });
            
            cardPrice1 = [[DBCardPrice alloc] initWithDictionary:edition1Dict];
            cardPrice2 = [[DBCardPrice alloc] initWithDictionary:edition2Dict];
            cardPrice3 = [[DBCardPrice alloc] initWithDictionary:edition3Dict];
        });
        
        it(@"returns FALSE when comparing sets 1 and 2", ^{
            expect([cardPrice1 isEqual:cardPrice2]).to.beFalsy();
        });
        
        it(@"returns TRUE when comparing sets 1 and 3", ^{
            expect([cardPrice1 isEqual:cardPrice3]).to.beTruthy();
        });
    });
});

SpecEnd

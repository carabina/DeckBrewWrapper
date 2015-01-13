#import <Specta/Specta.h>
#define EXP_SHORTHAND
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import <OCFixture/OCFixture.h>
#import "DBCardPrice.h"
#import "DBCardEdition.h"

@interface DBCardPrice ()
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end

SpecBegin(DBCardPrice)

describe(@"DBCardPrice", ^{
    __block DBCardPrice *price;
    __block NSArray *cards;
    __block NSArray *editions;
    __block NSDictionary *edition;
    
    beforeAll(^{
        cards = [OCFixture fixtureFromJSONFile:@"fixture_cards"];
    });
    
    context(@"complete data", ^{
        beforeEach(^{
            editions = cards.firstObject[@"editions"];
            edition = editions.firstObject;
            
            price = [[DBCardPrice alloc] initWithDictionary:edition[@"price"]];
        });
        
        it(@"has the correct low price", ^{
            expect(price.low).to.equal(89);
        });

        it(@"has the correct average price", ^{
            expect(price.median).to.equal(154);
        });

        it(@"has the correct high price", ^{
            expect(price.high).to.equal(198);
        });
    });
    
    context(@"incomplete data", ^{
        beforeEach(^{
            editions = cards.lastObject[@"editions"];
            edition = editions.lastObject;
            
            price = [[DBCardPrice alloc] initWithDictionary:edition[@"price"]];
        });
        
        it(@"has the correct low price", ^{
            expect(price.low).to.equal(0);
        });
        
        it(@"has the correct average price", ^{
            expect(price.median).to.equal(154);
        });
        
        it(@"has the correct high price", ^{
            expect(price.high).to.equal(0);
        });
    });
    
    context(@"inexistent data", ^{
        beforeEach(^{
            editions = cards.lastObject[@"editions"];
            edition = editions.firstObject;
            
            price = [[DBCardPrice alloc] initWithDictionary:edition[@"price"]];
        });
        
        it(@"has the correct low price", ^{
            expect(price.low).to.equal(0);
        });
        
        it(@"has the correct average price", ^{
            expect(price.median).to.equal(0);
        });
        
        it(@"has the correct high price", ^{
            expect(price.high).to.equal(0);
        });
    });
    
    describe(@"-isEqual:", ^{
        __block DBCardPrice *cardPrice1, *cardPrice2, *cardPrice3;
        
        beforeEach(^{
            NSDictionary *edition1Dict = ({
                NSArray *editions = cards.firstObject[@"editions"];
                editions.firstObject[@"price"];
            });
            
            NSDictionary *edition2Dict = ({
                NSArray *editions = cards.lastObject[@"editions"];
                editions.firstObject[@"price"];
            });
            
            NSDictionary *edition3Dict = ({
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

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
});

SpecEnd

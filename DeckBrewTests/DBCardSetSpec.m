#import <Specta/Specta.h>
#define EXP_SHORTHAND
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import <OCFixture/OCFixture.h>
#import "DBCardSet.h"

@interface DBCardSet ()
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end

SpecBegin(DBCardSet)

describe(@"DBCardSet", ^{
    __block DBCardSet *cardSet;
    __block NSArray *cardSets;
    
    beforeAll(^{
        cardSets = [OCFixture fixtureFromJSONFile:@"fixture_sets"];
        cardSet = [[DBCardSet alloc] initWithDictionary:cardSets.lastObject];
    });
    
    describe(@"properties", ^{
        it(@"has the correct id", ^{
            expect(cardSet.identifier).to.equal(@"pFNM");
        });
        
        it(@"has the correct name", ^{
            expect(cardSet.name).to.equal(@"Friday Night Magic");
        });
        
        it(@"has the correct border", ^{
            expect(cardSet.border).to.equal(@"black");
        });
        
        it(@"has the correct type", ^{
            expect(cardSet.type).to.equal(@"promo");
        });
    });
    
    describe(@"-isEqual:", ^{
        __block DBCardSet *cardSet1, *cardSet2, *cardSet3;
        
        beforeEach(^{
            cardSet1 = [[DBCardSet alloc] initWithDictionary:cardSets.firstObject];
            cardSet2 = [[DBCardSet alloc] initWithDictionary:cardSets.lastObject];
            cardSet3 = [[DBCardSet alloc] initWithDictionary:cardSets.lastObject];
        });
        
        it(@"returns FALSE when comparing sets 1 and 2", ^{
            expect([cardSet1 isEqual:cardSet2]).to.beFalsy();
        });
        
        it(@"returns TRUE when comparing sets 2 and 3", ^{
            expect([cardSet2 isEqual:cardSet3]).to.beTruthy();
        });
    });
});

SpecEnd

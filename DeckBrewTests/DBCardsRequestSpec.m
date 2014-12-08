#import <Specta/Specta.h>
#define EXP_SHORTHAND
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import "DBCardsRequest.h"

SpecBegin(DBCardsRequest)

describe(@"DBCardsRequest", ^{
    describe(@"#init", ^{
        __block DBCardsRequest *request;
        
        beforeEach(^{
            request = [[DBCardsRequest alloc] init];
        });
        
        it(@"has NSNotFound as default pagination", ^{
            expect(request.page).equal(0);
        });
        
        it(@"return the correct path", ^{
            expect(request.path).to.equal(@"/mtg/cards");
        });
        
        it(@"returns the correct dictionary of parameters", ^{
            expect(request.parameters).to.beNil();
        });
        
        it(@"has the correct response serialzation", ^{
            expect(request.responseSerializer).to.equal(DBResponseSerializerCards);
        });
    });
    
    describe(@"#initWithSetID:", ^{
        __block DBCardsRequest *request;
        __block NSDictionary *expectedDict;
        
        beforeEach(^{
            expectedDict = @{DBFilterSet : @"KTK",
                             DBFilterMulticolor : @"false",
                             DBFilterColor : @"red"};
            
            request = [[DBCardsRequest alloc] initWithFilter:@{DBFilterSet : @"KTK",
                                                               DBFilterMulticolor : @"false",
                                                               DBFilterColor : @"red"}];
        });
        
        it(@"return the correct path", ^{
            expect(request.path).to.equal(@"/mtg/cards");
        });
        
        it(@"returns the correct dictionary of parameters", ^{
            expect(request.parameters).to.beSupersetOf(expectedDict);
        });
        
        it(@"has the correct response serialzation", ^{
            expect(request.responseSerializer).to.equal(DBResponseSerializerCards);
        });
    });
});

SpecEnd

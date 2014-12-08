#import <Specta/Specta.h>
#define EXP_SHORTHAND
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import "DBCardSetsRequest.h"

SpecBegin(DBCardSetsRequest)

describe(@"DBCardSetsRequest", ^{
    __block DBCardSetsRequest *request;
    
    beforeEach(^{
        request = [[DBCardSetsRequest alloc] init];
    });
    
    it(@"does not blow up", ^{
        expect(request).notTo.beNil();
    });
    
    it(@"has the correct path", ^{
        expect(request.path).to.equal(@"/mtg/sets");
    });
    
    it(@"has the correct path", ^{
        expect(request.parameters).to.beNil();
    });
    
    it(@"has the correct response serialzation", ^{
        expect(request.responseSerializer).to.equal(DBResponseSerializerSets);
    });
});

SpecEnd

#import <Specta/Specta.h>
#define EXP_SHORTHAND
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import "DBCardSetRequest.h"

SpecBegin(DBCardSetRequest)

describe(@"DBCardSetRequest", ^{
    __block DBCardSetRequest *request;
    
    beforeEach(^{
        request = [[DBCardSetRequest alloc] initWithSetID:@"420"];
    });
    
    it(@"does not blow up", ^{
        expect(request).notTo.beNil();
    });
    
    it(@"has the correct path", ^{
        expect(request.path).to.equal(@"/mtg/sets/420");
    });
    
    it(@"has the correct path", ^{
        expect(request.parameters).to.beNil();
    });
    
    it(@"has the correct response serialzation", ^{
        expect(request.responseSerializer).to.equal(DBResponseSerializerSet);
    });
});

SpecEnd

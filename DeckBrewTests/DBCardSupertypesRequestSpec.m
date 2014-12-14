#import <Specta/Specta.h>
#define EXP_SHORTHAND
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import "DBCardSupertypesRequest.h"

SpecBegin(DBCardSupertypesRequest)

describe(@"DBCardSupertypesRequest", ^{
    __block DBCardSupertypesRequest *request;

    beforeEach(^{
        request = [[DBCardSupertypesRequest alloc] init];
    });
    
    it(@"does not blow up", ^{
        expect(request).notTo.beNil();
    });
    
    it(@"has the correct path", ^{
        expect(request.path).to.equal(@"/mtg/supertypes");
    });
    
    it(@"has the correct path", ^{
        expect(request.parameters).to.beNil();
    });
});

SpecEnd

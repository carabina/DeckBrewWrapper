#import <Specta/Specta.h>
#define EXP_SHORTHAND
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import "DBCardSubtypesRequest.h"

SpecBegin(DBCardSubtypesRequest)

describe(@"DBCardSubtypesRequest", ^{
    __block DBCardSubtypesRequest *request;

    beforeEach(^{
        request = [[DBCardSubtypesRequest alloc] init];
    });
    
    it(@"does not blow up", ^{
        expect(request).notTo.beNil();
    });
    
    it(@"has the correct path", ^{
        expect(request.path).to.equal(@"/mtg/subtypes");
    });
    
    it(@"has the correct path", ^{
        expect(request.parameters).to.beNil();
    });
});

SpecEnd

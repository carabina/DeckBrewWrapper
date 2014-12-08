#import <Specta/Specta.h>
#define EXP_SHORTHAND
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import "DBCardTypesRequest.h"

SpecBegin(DBCardTypesRequest)

describe(@"DBCardTypesRequest", ^{
    __block DBCardTypesRequest *request;

    beforeEach(^{
        request = [[DBCardTypesRequest alloc] init];
    });
    
    it(@"does not blow up", ^{
        expect(request).notTo.beNil();
    });
    
    it(@"has the correct path", ^{
        expect(request.path).to.equal(@"/mtg/types");
    });
    
    it(@"has the correct path", ^{
        expect(request.parameters).to.beNil();
    });
});

SpecEnd

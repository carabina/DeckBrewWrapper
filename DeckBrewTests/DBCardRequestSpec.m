#import <Specta/Specta.h>
#define EXP_SHORTHAND
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import "DBCardRequest.h"

SpecBegin(DBCardRequest)

describe(@"DBCardRequest", ^{
    __block DBCardRequest *request;
    
    beforeEach(^{
        request = [[DBCardRequest alloc] initWithCardID:@"420"];
    });
    
    it(@"does not blow up", ^{
        expect(request).notTo.beNil();
    });
    
    it(@"has the correct path", ^{
        expect(request.path).to.equal(@"/mtg/cards/420");
    });
    
    it(@"has the correct path", ^{
        expect(request.parameters).to.beNil();
    });
});

SpecEnd

#import <AFNetworking/AFNetworking.h>
#import <Specta/Specta.h>
#define EXP_SHORTHAND
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import "DBAPIWrapper.h"
#import "DBRequest.h"

@interface DBAPIWrapper (Test)
@property (strong, nonatomic) AFHTTPRequestOperationManager *reqManager;
@end

SpecBegin(DBAPIWrapper)

describe(@"DBAPIWrapper", ^{
    __block DBAPIWrapper *wrapper;
    
    beforeEach(^{
        wrapper = [[DBAPIWrapper alloc] init];
    });
    
    it(@"does not blow up", ^{
        expect(wrapper).notTo.beNil();
    });
    
    describe(@"#submitRequest:success:failure:", ^{
        __block id mockRequest;
        __block id mockReqManager;
        
        beforeEach(^{
            mockReqManager = OCMClassMock([AFHTTPRequestOperationManager class]);
            wrapper.reqManager = mockReqManager;
            
            mockRequest = OCMClassMock([DBRequest class]);
            OCMStub([mockRequest path]).andReturn(@"/path");
            OCMStub([mockRequest parameters]).andReturn(@{@"foo" : @"bar"});
            
            [wrapper submitRequest:mockRequest
                           success:^(DBRequest *request, id responseObject) {}
                           failure:^(DBRequest *request, NSError *error) {}];
        });
        
        it(@"makes a GET request with correct path and parameters", ^{
            OCMVerify([wrapper.reqManager GET:@"/path"
                                   parameters:@{@"foo" : @"bar"}
                                      success:[OCMArg any]
                                      failure:[OCMArg any]]);
        });
    });
});

SpecEnd

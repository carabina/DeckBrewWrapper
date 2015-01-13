#import <Specta/Specta.h>
#define EXP_SHORTHAND
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>
#import <OCFixture/OCFixture.h>
#import "DBResponse.h"
#import "DBRequest.h"
#import "DBCard.h"
#import "DBCardSet.h"

@interface DBCard ()
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end

@interface DBCardSet ()
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end

SpecBegin(DBResponse)

describe(@"DBResponse", ^{
    __block DBResponse *response;
    __block NSArray *cards;
    __block NSArray *sets;
    __block id mockRequest;
    __block DBRequest *passedRequest;
    __block id passedObject;
    
    beforeAll(^{
        cards = [OCFixture fixtureFromJSONFile:@"fixture_cards"];
        sets = [OCFixture fixtureFromJSONFile:@"fixture_sets"];
    });
    
    context(@"DBResponseSerializerCard", ^{
        beforeEach(^{
            mockRequest = OCMClassMock([DBRequest class]);
            OCMStub([mockRequest responseSerializer]).andReturn(DBResponseSerializerCard);
            response = [[DBResponse alloc] initWithResponseObject:cards.firstObject];
            
            [response serializeResponseForRequest:mockRequest
                                          success:^(DBRequest *request, id object) {
                                              passedRequest = request;
                                              passedObject = object;
                                          }];
        });
        
        it(@"returns the correct request object", ^{
            expect(passedRequest).to.equal(mockRequest);
        });
        
        it(@"returns the correct card", ^{
            DBCard *expectedCard = [[DBCard alloc] initWithDictionary:cards.firstObject];
            expect(passedObject).to.beInstanceOf([DBCard class]);
            expect(passedObject).to.equal(expectedCard);
        });
    });
    
    context(@"DBResponseSerializerCards", ^{
        beforeEach(^{
            mockRequest = OCMClassMock([DBRequest class]);
            OCMStub([mockRequest responseSerializer]).andReturn(DBResponseSerializerCards);
            response = [[DBResponse alloc] initWithResponseObject:cards];
            
            [response serializeResponseForRequest:mockRequest
                                          success:^(DBRequest *request, id object) {
                                              passedRequest = request;
                                              passedObject = object;
                                          }];
        });
        
        it(@"returns the correct request object", ^{
            expect(passedRequest).to.equal(mockRequest);
        });
        
        it(@"returns the correct array of cards", ^{
            DBCard *expectedCard = [[DBCard alloc] initWithDictionary:cards.firstObject];
            
            expect(passedObject).to.beKindOf([NSArray class]);
            expect([passedObject count]).to.equal(2);
            
            expect([passedObject firstObject]).to.equal(expectedCard);
        });
    });
    
    context(@"DBResponseSerializerSet", ^{
        beforeEach(^{
            mockRequest = OCMClassMock([DBRequest class]);
            OCMStub([mockRequest responseSerializer]).andReturn(DBResponseSerializerSet);
            response = [[DBResponse alloc] initWithResponseObject:sets.firstObject];
            
            [response serializeResponseForRequest:mockRequest
                                          success:^(DBRequest *request, id object) {
                                              passedRequest = request;
                                              passedObject = object;
                                          }];
        });
        
        it(@"returns the correct request object", ^{
            expect(passedRequest).to.equal(mockRequest);
        });
        
        it(@"returns the correct set", ^{
            DBCardSet *expectedSet = [[DBCardSet alloc] initWithDictionary:sets.firstObject];
            expect(passedObject).to.beInstanceOf([DBCardSet class]);
            expect(passedObject).to.equal(expectedSet);
        });
    });
    
    context(@"DBResponseSerializerSets", ^{
        beforeEach(^{
            mockRequest = OCMClassMock([DBRequest class]);
            OCMStub([mockRequest responseSerializer]).andReturn(DBResponseSerializerSets);
            response = [[DBResponse alloc] initWithResponseObject:sets];
            
            [response serializeResponseForRequest:mockRequest
                                          success:^(DBRequest *request, id object) {
                                              passedRequest = request;
                                              passedObject = object;
                                          }];
        });
        
        it(@"returns the correct request object", ^{
            expect(passedRequest).to.equal(mockRequest);
        });
        
        it(@"returns the correct array of sets", ^{
            DBCardSet *expectedSet = [[DBCardSet alloc] initWithDictionary:sets.firstObject];
            
            expect(passedObject).to.beKindOf([NSArray class]);
            expect([passedObject count]).to.equal(2);
            
            expect([passedObject firstObject]).to.equal(expectedSet);
        });
    });
});

SpecEnd

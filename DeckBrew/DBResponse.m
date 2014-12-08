#import "DBResponse.h"
#import "DBRequest.h"
#import "DBCard.h"
#import "DBCardSet.h"

@interface DBResponse ()
@property (nonatomic, strong) id responseObject;
@end

@interface DBCard ()
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end

@interface DBCardSet ()
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end

@implementation DBResponse

#pragma mark - Initialization

- (instancetype)initWithResponseObject:(id)responseObject
{
    self = [super init];
    
    if (self) {
        self.responseObject = responseObject;
    }
    
    return self;
}

- (void)serializeResponseForRequest:(DBRequest *)request
                            success:(void (^)(DBRequest *request, id object))success
{
    switch (request.responseSerializer) {
        case DBResponseSerializerCard: {
            DBCard *card = [[DBCard alloc] initWithDictionary:self.responseObject];
            success(request, card);
        } break;
            
        case DBResponseSerializerCards: {
            NSMutableArray *cards = [NSMutableArray array];
            for (NSDictionary *cardDictionary in self.responseObject) {
                DBCard *card = [[DBCard alloc] initWithDictionary:cardDictionary];
                [cards addObject:card];
            }
            success(request, cards.copy);
        } break;
            
        case DBResponseSerializerSet: {
            DBCardSet *set = [[DBCardSet alloc] initWithDictionary:self.responseObject];
            success(request, set);
        } break;
            
        case DBResponseSerializerSets: {
            NSMutableArray *sets = [NSMutableArray array];
            for (NSDictionary *setDictionary in self.responseObject) {
                DBCardSet *set = [[DBCardSet alloc] initWithDictionary:setDictionary];
                [sets addObject:set];
            }
            success(request, sets.copy);
        } break;
            
        default: {
            success(request, self.responseObject);
        } break;
    }
}

@end

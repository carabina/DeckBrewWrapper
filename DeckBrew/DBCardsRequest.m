#import "DBCardsRequest.h"

NSString *const DBFilterType = @"type";
NSString *const DBFilterSubtype = @"subtype";
NSString *const DBFilterSupertype = @"supertype";
NSString *const DBFilterName = @"name";
NSString *const DBFilterOracle = @"oracle";
NSString *const DBFilterSet = @"set";
NSString *const DBFilterRarity = @"rarity";
NSString *const DBFilterColor = @"color";
NSString *const DBFilterMulticolor = @"multicolor";
NSString *const DBFilterMultiverseID = @"multiverseid";
NSString *const DBFilterFormat = @"format";
NSString *const DBFilterStatus = @"status";

@interface DBCardsRequest ()
@property (nonatomic, strong) NSDictionary *filter;
@end

@implementation DBCardsRequest

#pragma mark - Initialization

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.page = 0;
    }
    
    return self;
}

- (instancetype)initWithFilter:(NSDictionary *)filter
{
    self = [super init];
    
    if (self) {
        self.filter = filter;
        self.page = 0;
    }
    
    return self;
}

#pragma mark - Request

- (NSString *)path
{
    return @"/mtg/cards";
}

- (NSDictionary *)parameters
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    if (self.page) {
        [params addEntriesFromDictionary:@{@"page" : @(self.page)}];
    }
    
    if (self.filter) {
        [params addEntriesFromDictionary:self.filter];
    }
    
    return params.count ? params.copy : nil;
}

- (DBResponseSerializer)responseSerializer
{
    return DBResponseSerializerCards;
}

@end

#import "DBCardSetRequest.h"

@interface DBCardSetRequest ()
@property (nonatomic, strong) NSString *setID;
@end

@implementation DBCardSetRequest

#pragma mark - Initialization

- (instancetype)initWithSetID:(NSString *)setID
{
    self = [super init];
    
    if (self) {
        self.setID = setID;
    }
    
    return self;
}

#pragma mark - Request

- (NSString *)path
{
    return [NSString stringWithFormat:@"/mtg/sets/%@", self.setID];
}

- (DBResponseSerializer)responseSerializer
{
    return DBResponseSerializerSet;
}

@end

#import "DBCardRequest.h"

@interface DBCardRequest ()
@property (nonatomic, strong) NSString *cardID;
@end

@implementation DBCardRequest

#pragma mark - Initialization

- (instancetype)initWithCardID:(NSString *)cardID
{
    self = [super init];
	
    if (self) {
        self.cardID = cardID;
    }
	
    return self;
}

#pragma mark - Request

- (NSString *)path
{
    return [NSString stringWithFormat:@"/mtg/cards/%@", self.cardID];
}

- (DBResponseSerializer)responseSerializer
{
    return DBResponseSerializerCard;
}

@end

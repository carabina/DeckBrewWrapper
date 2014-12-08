#import "DBCardSetsRequest.h"

@implementation DBCardSetsRequest

#pragma mark - Request

- (NSString *)path
{
    return @"/mtg/sets";
}

- (DBResponseSerializer)responseSerializer
{
    return DBResponseSerializerSets;
}

@end

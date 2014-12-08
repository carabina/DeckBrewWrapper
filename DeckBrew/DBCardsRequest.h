#import "DBRequest.h"

extern NSString *const DBFilterType;
extern NSString *const DBFilterSubtype;
extern NSString *const DBFilterSupertype;
extern NSString *const DBFilterName;
extern NSString *const DBFilterOracle;
extern NSString *const DBFilterSet;
extern NSString *const DBFilterRarity;
extern NSString *const DBFilterColor;
extern NSString *const DBFilterMulticolor;
extern NSString *const DBFilterMultiverseID;
extern NSString *const DBFilterFormat;
extern NSString *const DBFilterStatus;

@interface DBCardsRequest : DBRequest

@property (nonatomic) NSInteger page;

- (instancetype)initWithFilter:(NSDictionary *)filter;

@end

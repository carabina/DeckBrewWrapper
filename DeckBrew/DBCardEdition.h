#import <Foundation/Foundation.h>

@class DBCardPrice;

@interface DBCardEdition : NSObject

@property (nonatomic, strong, readonly) NSString *set;
@property (nonatomic, strong, readonly) NSString *setID;
@property (nonatomic, strong, readonly) NSString *rarity;
@property (nonatomic, strong, readonly) NSString *artist;
@property (nonatomic, strong, readonly) NSString *flavor;
@property (nonatomic, strong, readonly) NSString *number;
@property (nonatomic, strong, readonly) NSString *layout;
@property (nonatomic, strong, readonly) DBCardPrice *price;
@property (nonatomic, strong, readonly) NSURL *imageURL;
@property (nonatomic, readonly) NSInteger multiverseID;

@end

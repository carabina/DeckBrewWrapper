#import <Foundation/Foundation.h>

@interface DBCard : NSObject

@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, strong, readonly) NSString *identifier;
@property (nonatomic, strong, readonly) NSString *manaCost;
@property (nonatomic, strong, readonly) NSString *text;
@property (nonatomic, strong, readonly) NSString *power;
@property (nonatomic, strong, readonly) NSString *toughness;
@property (nonatomic, strong, readonly) NSArray *types;
@property (nonatomic, strong, readonly) NSArray *subtypes;
@property (nonatomic, strong, readonly) NSArray *colors;
@property (nonatomic, strong, readonly) NSArray *editions;
@property (nonatomic, readonly) NSInteger convertedManaCost;

@end

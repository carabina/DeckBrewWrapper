#import "DBCardPrice.h"

@interface DBCardPrice ()
@property (nonatomic, readwrite) NSInteger low;
@property (nonatomic, readwrite) NSInteger average;
@property (nonatomic, readwrite) NSInteger high;
@end

@implementation DBCardPrice

#pragma mark - Initialization

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    
    if (self) {
        self.low = [dictionary[@"low"] integerValue];
        self.average = [dictionary[@"average"] integerValue];
        self.high = [dictionary[@"high"] integerValue];
    }
    
    return self;
}

- (NSString *)description
{
    NSMutableString *description = [NSMutableString string];
    
    [description appendFormat:@"<DBCardPrice: %p", self];
    [description appendFormat:@", low: %@", @(self.low)];
    [description appendFormat:@", average: %@", @(self.average)];
    [description appendFormat:@", high: %@", @(self.high)];
    [description appendFormat:@">"];
    
    return description.copy;
}

#pragma mark - Equality

- (BOOL)isEqual:(id)object
{
    if (object == self) return YES;
    if (!object || ![object isKindOfClass:[self class]]) return NO;
    return [self isEqualCardPrice:object];
}

- (BOOL)isEqualCardPrice:(DBCardPrice *)cardPrice
{
    return (self.average == cardPrice.average);
}

@end

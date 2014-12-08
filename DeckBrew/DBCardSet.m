#import "DBCardSet.h"

@interface DBCardSet ()
@property (nonatomic, strong, readwrite) NSString *identifier;
@property (nonatomic, strong, readwrite) NSString *name;
@property (nonatomic, strong, readwrite) NSString *border;
@property (nonatomic, strong, readwrite) NSString *type;
@end

@implementation DBCardSet

#pragma mark - Initialization

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    
    if (self) {
        self.identifier = dictionary[@"id"];
        self.name = dictionary[@"name"];
        self.border = dictionary[@"border"];
        self.type = dictionary[@"type"];
    }
    
    return self;
}

- (NSString *)description
{
    NSMutableString *description = [NSMutableString string];
    
    [description appendFormat:@"<DBCardSet: %p", self];
    [description appendFormat:@", name: %@", self.name];
    [description appendFormat:@", id: %@", self.identifier];
    [description appendFormat:@", border: %@", self.border];
    [description appendFormat:@", type: %@", self.type];
    [description appendFormat:@">"];
    
    return description.copy;
}

#pragma mark - Equality & Identity

- (BOOL)isEqual:(id)object
{
    if (object == self) return YES;
    if (!object || ![object isKindOfClass:[self class]]) return NO;
    return [self isEqualCardSet:object];
}

- (BOOL)isEqualCardSet:(DBCardSet *)other
{
    return [self.identifier isEqualToString:other.identifier];
}

- (NSUInteger)hash
{
    return [self.identifier hash] ^ [self.name hash];
}

@end

#import "DBCard.h"
#import "DBCardEdition.h"

@interface DBCard ()
@property (nonatomic, strong, readwrite) NSString *name;
@property (nonatomic, strong, readwrite) NSString *identifier;
@property (nonatomic, strong, readwrite) NSString *manaCost;
@property (nonatomic, strong, readwrite) NSString *text;
@property (nonatomic, strong, readwrite) NSString *power;
@property (nonatomic, strong, readwrite) NSString *toughness;
@property (nonatomic, strong, readwrite) NSArray *types;
@property (nonatomic, strong, readwrite) NSArray *subtypes;
@property (nonatomic, strong, readwrite) NSArray *colors;
@property (nonatomic, strong, readwrite) NSArray *editions;
@property (nonatomic, readwrite) NSInteger convertedManaCost;
@end

@interface DBCardEdition ()
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end

@implementation DBCard

#pragma mark - Initialization

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    
    if (self) {
        self.name = dictionary[@"name"];
        self.identifier = dictionary[@"id"];
        self.manaCost = dictionary[@"cost"];
        self.text = dictionary[@"text"];
        self.power = dictionary[@"power"];
        self.toughness = dictionary[@"toughness"];
        self.colors = dictionary[@"colors"];
        self.types = dictionary[@"types"];
        self.subtypes = dictionary[@"subtypes"];
        self.editions = [self editionsFromArray:dictionary[@"editions"]];
        self.convertedManaCost = [dictionary[@"cmc"] integerValue];
    }
    
    return self;
}

- (NSString *)description
{
    NSMutableString *description = [NSMutableString string];
    
    [description appendFormat:@"<DBCard: %p", self];
    [description appendFormat:@", name: %@", self.name];
    [description appendFormat:@", id: %@", self.identifier];
    [description appendFormat:@", mana cost: %@", @(self.convertedManaCost)];
    [description appendFormat:@", # editions: %@", @(self.editions.count)];
    [description appendFormat:@">"];
    
    return description.copy;
}

#pragma mark - Equality & Identity

- (BOOL)isEqual:(id)object
{
    if (object == self) return YES;
    if (!object || ![object isKindOfClass:[self class]]) return NO;
    return [self isEqualCard:object];
}

- (BOOL)isEqualCard:(DBCard *)card
{
    return (self.identifier == card.identifier);
}

- (NSUInteger)hash
{
    return [self.name hash] ^ [self.identifier hash];
}

#pragma mark - Private

- (NSArray *)editionsFromArray:(NSArray *)editions
{
    NSMutableArray *editionsArray = [NSMutableArray array];
    
    for (NSDictionary *editionDictionary in editions) {
        DBCardEdition *edition = [[DBCardEdition alloc] initWithDictionary:editionDictionary];
        [editionsArray addObject:edition];
    }
    
    return editionsArray.copy;
}

@end

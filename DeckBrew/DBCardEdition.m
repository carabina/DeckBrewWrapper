#import "DBCardEdition.h"

@interface DBCardEdition ()
@property (nonatomic, strong, readwrite) NSString *set;
@property (nonatomic, strong, readwrite) NSString *setID;
@property (nonatomic, strong, readwrite) NSString *rarity;
@property (nonatomic, strong, readwrite) NSString *artist;
@property (nonatomic, strong, readwrite) NSString *flavor;
@property (nonatomic, strong, readwrite) NSString *number;
@property (nonatomic, strong, readwrite) NSString *layout;
@property (nonatomic, strong, readwrite) NSURL *imageURL;
@property (nonatomic, readwrite) NSInteger multiverseID;
@end

@implementation DBCardEdition

#pragma mark - Initialization

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    
    if (self) {
        self.set = dictionary[@"set"];
        self.setID = dictionary[@"set_id"];
        self.rarity = dictionary[@"rarity"];
        self.artist = dictionary[@"artist"];
        self.flavor = dictionary[@"flavor"];
        self.number = dictionary[@"number"];
        self.layout = dictionary[@"layout"];
        self.multiverseID = [dictionary[@"multiverse_id"] integerValue];
        self.imageURL = ({
            NSString *urlString = dictionary[@"image_url"];
            NSURL *url = [NSURL URLWithString:urlString];
            url;
        });
    }
    
    return self;
}

- (NSString *)description
{
    NSMutableString *description = [NSMutableString string];
    
    [description appendFormat:@"<DBCardEdition: %p", self];
    [description appendFormat:@", set: %@", self.set];
    [description appendFormat:@", multiverseID: %@", @(self.multiverseID)];
    [description appendFormat:@", rarity: %@", self.rarity];
    [description appendFormat:@", layout: %@", self.layout];
    [description appendFormat:@">"];
    
    return description.copy;
}

#pragma mark - Equality & Identity

- (BOOL)isEqual:(id)object
{
    if (object == self) return YES;
    if (!object || ![object isKindOfClass:[self class]]) return NO;
    return [self isEqualCardEdition:object];
}

- (BOOL)isEqualCardEdition:(DBCardEdition *)cardEdition
{
    return (self.set == cardEdition.set &&
            self.multiverseID == cardEdition.multiverseID);
}

- (NSUInteger)hash
{
    return [self.set hash] ^ [@(self.multiverseID) hash];
}

@end

#import "DBSetsFixture.h"

@implementation DBSetsFixture

+ (NSArray *)setsFixture
{
    return @[
             @{
                 @"id": @"4ED",
                 @"name": @"Fourth Edition",
                 @"border": @"white",
                 @"type": @"core",
                 @"url": @"https://api.deckbrew.com/mtg/sets/4ED",
                 @"cards_url": @"https://api.deckbrew.com/mtg/cards?set=4ED"
                 },
             @{
                 @"id": @"pFNM",
                 @"name": @"Friday Night Magic",
                 @"border": @"black",
                 @"type": @"promo",
                 @"url": @"https://api.deckbrew.com/mtg/sets/pFNM",
                 @"cards_url": @"https://api.deckbrew.com/mtg/cards?set=pFNM"
                 }
             ];
}

@end

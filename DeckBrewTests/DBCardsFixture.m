#import "DBCardsFixture.h"

@implementation DBCardsFixture

#pragma mark - Initialization

+ (NSArray *)cardsFixture
{
    return @[
             @{
                 @"name": @"Ashen Firebeast",
                 @"id": @"ashen-firebeast",
                 @"types": @[@"creature"],
                 @"subtypes": @[@"beast", @"elemental"],
                 @"colors": @[@"red"],
                 @"cmc": @8,
                 @"cost": @"{6}{R}{R}",
                 @"text": @"{1}{R}: Ashen Firebeast deals 1 damage to each creature without flying.",
                 @"power": @"6",
                 @"toughness": @"6",
                 @"editions": @[
                         @{
                             @"set": @"Odyssey",
                             @"set_id": @"ODY",
                             @"rarity": @"rare",
                             @"artist": @"Mark Tedin",
                             @"multiverse_id": @29965,
                             @"flavor": @"\"I'm not sure which impresses me most, its thoroughness or its intensity.\"\n—Matoc, lavamancer",
                             @"number": @"174",
                             @"layout": @"normal",
                             @"price" : @{
                                     @"low": @89,
                                     @"average" : @154,
                                     @"high": @198
                                     },
                             @"image_url": @"https://image.deckbrew.com/mtg/multiverseid/29965.jpg"
                             }
                         ]
                 },
             @{
                 @"name": @"Balefire Liege",
                 @"id": @"balefire-liege",
                 @"types": @[@"creature"],
                 @"subtypes": @[@"horror", @"spirit"],
                 @"colors": @[@"red", @"white"],
                 @"cmc": @5,
                 @"cost": @"{2}{R/W}{R/W}{R/W}",
                 @"text": @"Other red creatures you control get +1/+1.\nOther white creatures you control get +1/+1.\nWhenever you cast a red spell, Balefire Liege deals 3 damage to target player.\nWhenever you cast a white spell, you gain 3 life.",
                 @"power": @"2",
                 @"toughness": @"4",
                 @"editions": @[
                         @{
                             @"set": @"Planechase",
                             @"set_id": @"HOP",
                             @"rarity": @"rare",
                             @"artist": @"Ralph Horsley",
                             @"multiverse_id": @205377,
                             @"number": @"97",
                             @"layout": @"normal",
                             @"image_url": @"https://image.deckbrew.com/mtg/multiverseid/205377.jpg"
                             },
                         @{
                             @"set": @"Eventide",
                             @"set_id": @"EVE",
                             @"rarity": @"rare",
                             @"artist": @"Ralph Horsley",
                             @"multiverse_id": @158104,
                             @"number": @"132",
                             @"layout": @"normal",
                             @"price" : @{
                                     @"average" : @154
                                     },
                             @"image_url": @"https://image.deckbrew.com/mtg/multiverseid/158104.jpg"
                             }
                         ]
                 }
             
             ];
}

@end

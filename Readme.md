![DeckBrew Wrapper](https://cloud.githubusercontent.com/assets/139272/5388522/32a6464c-80a1-11e4-8bb9-cfb1f1692889.png)
[![Travis-CI](https://img.shields.io/travis/otaviocc/DeckBrewWrapper.svg)](https://travis-ci.org/otaviocc/DeckBrewWrapper) [![CocoaPod Version](https://img.shields.io/cocoapods/v/DeckBrewWrapper.svg)](http://cocoapods.org/?q=DeckBrewWrapper) [![CocoaPod Platform](https://img.shields.io/cocoapods/p/DeckBrewWrapper.svg)](http://cocoapods.org/?q=DeckBrewWrapper) [![License](https://img.shields.io/cocoapods/l/DeckBrewWrapper.svg)](http://cocoapods.org/?q=DeckBrewWrapper)

DeckBrew Wrapper is an Objective-C client/wrapper for [Deck Brew](https://deckbrew.com/), an awesome [Magic the Gathering](http://magic.wizards.com/) API. It consists of an API wrapper responsible for the network calls (``DBAPIWrapper``), requests classes (subclasses of the ``DBRequest`` class), and classes for cards and card sets (``DBCard``, ``DBCardEdition``, and ``DBCardSet``).

---

* [API Wrapper](#api-wrapper)
* Requests
    * [Card Colors](#card-colors)
    * [Card Types Requests](#card-types-requests)
    * [Cards Requests](#cards-requests)
    * [Card Sets Requests](#card-sets-requests)
    * [Example](#example)
* Objects
    * [DBCard](#dbcard)
    * [DBCardEdition](#dbcardedition)
    * [DBCardSet](#dbcardset)
* [Contributing](#contributing)
* [License](#license)

---

## How to use it?

[CocoaPods](http://cocoapods.org) is the recommended way to consume DeckBrew Wrapper.

1. Add DeckBrewWrapper to your Podfile: ``pod 'DeckBrewWrapper'``
    1. Use ``pod search DeckBrewWrapper`` to search for specific versions of DeckBrewWrapper.
1. Install the pod by running `pod install`.
1. Import the DeckBrewWrapper's header file in your project: ``#import <DeckBrewWrapper/DeckBrewWrapper.h>``

## API Wrapper

``DBAPIWrapper`` doesn't have custom init methods and can be easily initialized with alloc/init,

```objective-c
DBAPIWrapper *wrapper = [[DBAPIWrapper alloc] init];
```

and it has one method, responsible for all the API requests:

```objective-c
- (void)submitRequest:(DBRequest *)request
              success:(void (^)(DBRequest *request, id responseObject))success
              failure:(void (^)(DBRequest *request, NSError *error))failure;
```

When requests are submitted, ``responseObject`` can assume different types depending on the request type. Possible types are:

* ``DBCard``
* ``DBCardSet``
* ``NSArray`` of
    * ``DBCard`` objects
    * ``DBCardSet`` objects
    * ``NSString`` objects

All the possible scenarios are described below.

## Requests

### Card Colors

* DBCardColorsRequest

``DBCardColorsRequest`` doesn't have custom init methods. When requests are submitted, ``responseObject`` returns as an ``NSArray`` of ``NSStrings``.

### Card Types Requests

* DBCardTypesRequest
* DBCardSupertypesRequest
* DBCardSubtypesRequest

``DBCardTypesRequest``, ``DBCardSupertypesRequest``, and ``DBCardSubtypesRequest`` don't have custom init methods. When requests are submitted, ``responseObject`` returns as an ``NSArray`` of ``NSStrings``.

### Cards Requests

* DBCardRequest
* DBCardsRequest

``DBCardRequest`` has a single init method that takes a card id. When the request is submitted, ``responseObject`` returns as a ``DBCard`` object.

```objective-c
@interface DBCardRequest : DBRequest
- (instancetype)initWithCardID:(NSString *)cardID;
@end
```

``DBCardsRequest`` has two init methods and a pagination property. When submitted, ``responseObject`` returns as an ``NSArray`` of ``DBCard`` objects.

```objective-c
@interface DBCardsRequest : DBRequest
@property (nonatomic) NSInteger page;
- (instancetype)init;
- (instancetype)initWithFilter:(NSDictionary *)filter;
@end
```

### Card Sets Requests

* DBCardSetRequest
* DBCardSetsRequest

``DBCardSetRequest`` has a single init method that takes a set id. When the request is submitted, ``responseObject`` returns as a ``DBCardSet`` object.

```objective-c
@interface DBCardSetRequest : DBRequest
- (instancetype)initWithSetID:(NSString *)setID;
@end
```

``DBCardSetsRequest`` has a single init methods. When requests are submitted, ``responseObject`` returns as an ``NSArray`` of ``DBCardSet`` objects.

```objective-c
@interface DBCardSetsRequest : DBRequest
- (instancetype)init;
@end
```

### Example

The example below shows a ``DBCardsRequest`` request using filters. It searches for cards with name *Shivan* on Fourth Edition and prints the card information and the edition where that card can also be found.

```objective-c
NSDictionary *filter = @{DBFilterName : @"Shivan",
                         DBFilterSet : @"4ED",
                         DBFilterMulticolor : @"false",
                         DBFilterColor : @"red"};

DBCardsRequest *request = [[DBCardsRequest alloc] initWithFilter:filter];

[self.wrapper submitRequest:request
                    success:^(DBRequest *request, NSArray *cards) {
                        for (DBCard *card in cards) {
                            NSLog(@"==> %@", card.description);
                            if (card.editions.count) {
                                NSLog(@"==> %@", card.editions);
                            }
                        }
                    } failure:^(DBRequest *request, NSError *error) {
                        NSLog(@"==> %@", error.localizedDescription);
                    }];
```

The ``filter`` dictionary allows the following keys:

```objective-c
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
```

Output from the code above:

```
==> <DBCard: 0x7c192a00, name: Shivan Dragon, id: shivan-dragon, mana cost: 6, # editions: 18>
==> (
    "<DBCardEdition: 0x7c1957b0, set: Revised Edition, multiverseID: 1318, rarity: rare, layout: normal>",
    "<DBCardEdition: 0x7c17c700, set: Seventh Edition, multiverseID: 25688, rarity: rare, layout: normal>",
    "<DBCardEdition: 0x7c196220, set: Masters Edition IV, multiverseID: 228264, rarity: rare, layout: normal>",
    "<DBCardEdition: 0x7c196290, set: Beatdown Box Set, multiverseID: 26622, rarity: rare, layout: normal>",
    "<DBCardEdition: 0x7c1976e0, set: From the Vault: Dragons, multiverseID: 178025, rarity: rare, layout: normal>",
    "<DBCardEdition: 0x7c197770, set: Limited Edition Alpha, multiverseID: 222, rarity: rare, layout: normal>",
    "<DBCardEdition: 0x7c1977e0, set: Magic 2015 Core Set, multiverseID: 383172, rarity: rare, layout: normal>",
    "<DBCardEdition: 0x7c197850, set: Fifth Edition, multiverseID: 4088, rarity: rare, layout: normal>",
    "<DBCardEdition: 0x7c1978c0, set: Eighth Edition, multiverseID: 45388, rarity: rare, layout: normal>",
    "<DBCardEdition: 0x7c197970, set: Tenth Edition, multiverseID: 129730, rarity: rare, layout: normal>",
    "<DBCardEdition: 0x7c1979e0, set: Magic 2014 Core Set, multiverseID: 370825, rarity: rare, layout: normal>",
    "<DBCardEdition: 0x7c197a50, set: Unlimited Edition, multiverseID: 819, rarity: rare, layout: normal>",
    "<DBCardEdition: 0x7c197ac0, set: Ninth Edition, multiverseID: 83259, rarity: rare, layout: normal>",
    "<DBCardEdition: 0x7c197b30, set: Duels of the Planeswalkers, multiverseID: 0, rarity: special, layout: normal>",
    "<DBCardEdition: 0x7c197ba0, set: Magic 2010, multiverseID: 191320, rarity: rare, layout: normal>",
    "<DBCardEdition: 0x7c197c10, set: Fourth Edition, multiverseID: 2303, rarity: rare, layout: normal>",
    "<DBCardEdition: 0x7c174600, set: Limited Edition Beta, multiverseID: 517, rarity: rare, layout: normal>",
    "<DBCardEdition: 0x7c197c80, set: Release Events, multiverseID: 0, rarity: special, layout: normal>"
    )
```

For more examples like this, clone this project and run the demo application.

## Objects

As mentioned before, ``responseObject`` can assume different types depending on the request type. Possible types are:

* ``DBCard``
* ``DBCardSet``
* ``NSArray`` of
    * ``DBCard`` objects
    * ``DBCardSet`` objects
    * ``NSString`` objects

### DBCard

``DBCard`` represents a Magic: the Gathering card. All properties are read-only. For convenience, it implements the methods ``-isEqual:``, ``-hash``, and it also implements the method ``-description`` as shown below:

```
<DBCard: 0x78f97e50, name: Shivan Dragon, id: shivan-dragon, mana cost: 6, # editions: 18>
```

Not all card information are exposed as a ``DBCard``'s properties. Some of them are exposed as ``DBCardEdition`` and can be accessed via ``DBCard``'s ``NSArray *editions`` property, which contains an array of ``DBCardEdition`` objects.

### DBCardEdition

``DBCardEdition`` represents a card edition. All properties are read-only. For convenience, it implements the methods ``-isEqual:``, ``-hash``, and it also implements the method ``-description`` as shown below:

```
<DBCardEdition: 0x78f98930, set: Fourth Edition, multiverseID: 2303, rarity: rare, layout: normal>
```

### DBCardSet

``DBCardSet`` represents a Magic: the Gathering set. All properties are read-only. It implements the methods ``-isEqual:``, ``-hash``, and ``-description`` as shown below:

```
<DBCardSet: 0x78f90f10, name: Khans of Tarkir, id: KTK, border: black, type: expansion>
```

# Contributing

Want to contribute? Perfect!

1. Fork it.
1. Create a branch (`git checkout -b my_awesome_feature`)
1. Commit your changes (`git commit -am "Added new awesome feature"`)
1. Make sure you have tests for the new feature
1. Push to the branch (`git push origin my_awesome_feature`)
1. Open a Pull Request
1. Enjoy a fancy latte and wait

# License

Copyright (c) 2014 Otavio Cordeiro. All rights reserved.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

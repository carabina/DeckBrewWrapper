#import "ViewController.h"
#import "DeckBrewWrapper.h"

@interface ViewController ()
@property (nonatomic, strong) DBAPIWrapper *wrapper;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.wrapper = [[DBAPIWrapper alloc] init];
}

#pragma mark - Private

#pragma mark Colors

- (IBAction)cardColorsTapped:(id)sender
{
    DBCardColorsRequest *request = [[DBCardColorsRequest alloc] init];
    
    [self.wrapper submitRequest:request
                        success:^(DBRequest *request, id responseObject) {
                            NSLog(@"==> %@", responseObject);
                        } failure:^(DBRequest *request, NSError *error) {
                            NSLog(@"==> %@", error.localizedDescription);
                        }];
}

#pragma mark Types

- (IBAction)cardTypesTapped:(id)sender
{
    DBCardTypesRequest *request = [[DBCardTypesRequest alloc] init];
    
    [self.wrapper submitRequest:request
                        success:^(DBRequest *request, id responseObject) {
                            NSLog(@"==> %@", responseObject);
                        } failure:^(DBRequest *request, NSError *error) {
                            NSLog(@"==> %@", error.localizedDescription);
                        }];
}

- (IBAction)cardSupertypesTapped:(id)sender
{
    DBCardSupertypesRequest *request = [[DBCardSupertypesRequest alloc] init];
    
    [self.wrapper submitRequest:request
                        success:^(DBRequest *request, id responseObject) {
                            NSLog(@"==> %@", responseObject);
                        } failure:^(DBRequest *request, NSError *error) {
                            NSLog(@"==> %@", error.localizedDescription);
                        }];
}

- (IBAction)cardSubtypesTapped:(id)sender
{
    DBCardSubtypesRequest *request = [[DBCardSubtypesRequest alloc] init];
    
    [self.wrapper submitRequest:request
                        success:^(DBRequest *request, id responseObject) {
                            NSLog(@"==> %@", responseObject);
                        } failure:^(DBRequest *request, NSError *error) {
                            NSLog(@"==> %@", error.localizedDescription);
                        }];
}

#pragma mark Cards

- (IBAction)cardTapped:(id)sender
{
    DBCardRequest *request = [[DBCardRequest alloc] initWithCardID:@"shivan-dragon"];
    
    [self.wrapper submitRequest:request
                        success:^(DBRequest *request, DBCard *card) {
                            NSLog(@"==> %@", card.description);
                            if (card.editions.count) {
                                NSLog(@"==> %@", card.editions);
                            }
                        } failure:^(DBRequest *request, NSError *error) {
                            NSLog(@"==> %@", error.localizedDescription);
                        }];
}

- (IBAction)cardsTapped:(id)sender
{
    DBCardsRequest *request = [[DBCardsRequest alloc] init];
    
    [self.wrapper submitRequest:request
                        success:^(DBRequest *request, NSArray *cards) {
                            NSLog(@"==> %@", cards);
                        } failure:^(DBRequest *request, NSError *error) {
                            NSLog(@"==> %@", error.localizedDescription);
                        }];
}

- (IBAction)cardsFromSetTapped:(id)sender
{
    NSDictionary *filter = @{DBFilterSet : @"KTK",
                             DBFilterMulticolor : @"false",
                             DBFilterColor : @"red"};
    
    DBCardsRequest *request = [[DBCardsRequest alloc] initWithFilter:filter];
    
    [self.wrapper submitRequest:request
                        success:^(DBRequest *request, NSArray *cards) {
                            NSLog(@"==> %@", cards);
                        } failure:^(DBRequest *request, NSError *error) {
                            NSLog(@"==> %@", error.localizedDescription);
                        }];
}

#pragma mark Sets

- (IBAction)setsTapped:(id)sender
{
    DBCardSetsRequest *request = [[DBCardSetsRequest alloc] init];
    
    [self.wrapper submitRequest:request
                        success:^(DBRequest *request, NSArray *sets) {
                            NSLog(@"==> %@", sets);
                        } failure:^(DBRequest *request, NSError *error) {
                            NSLog(@"==> %@", error.localizedDescription);
                        }];
}

- (IBAction)setTapped:(id)sender
{
    DBCardSetRequest *request = [[DBCardSetRequest alloc] initWithSetID:@"KTK"];
    
    [self.wrapper submitRequest:request
                        success:^(DBRequest *request, DBCardSet *set) {
                            NSLog(@"==> %@", set);
                        } failure:^(DBRequest *request, NSError *error) {
                            NSLog(@"==> %@", error.localizedDescription);
                        }];
}

@end

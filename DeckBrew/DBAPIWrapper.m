#import <AFNetworking/AFNetworking.h>
#import "DBAPIWrapper.h"
#import "DBRequest.h"

static NSString *const kDBAPIBaseURL = @"https://api.deckbrew.com";

@interface DBAPIWrapper ()
@property (nonatomic, strong) AFHTTPRequestOperationManager *reqManager;
@end

@implementation DBAPIWrapper

#pragma mark - Initialization

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.reqManager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:kDBAPIBaseURL]];
    }
    
    return self;
}

- (void)submitRequest:(DBRequest *)request
              success:(void (^)(DBRequest *request, id responseObject))success
              failure:(void (^)(DBRequest *request, NSError *error))failure
{
    [self.reqManager GET:request.path
              parameters:request.parameters
                 success:^(AFHTTPRequestOperation *operation, id responseObject) {
                     DBResponse *response = [[DBResponse alloc] initWithResponseObject:responseObject];
                     [response serializeResponseForRequest:request success:success];
                 } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                     failure(request, error);
                 }];
}

@end

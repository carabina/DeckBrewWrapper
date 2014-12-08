#import <Foundation/Foundation.h>

@class DBRequest;

@interface DBAPIWrapper : NSObject

- (void)submitRequest:(DBRequest *)request
              success:(void (^)(DBRequest *request, id responseObject))success
              failure:(void (^)(DBRequest *request, NSError *error))failure;

@end

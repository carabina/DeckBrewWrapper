#import <Foundation/Foundation.h>
#import "DBResponse.h"

@interface DBRequest : NSObject

@property (nonatomic, strong, readonly) NSString *path;
@property (nonatomic, strong, readonly) NSDictionary *parameters;
@property (nonatomic, readonly) DBResponseSerializer responseSerializer;

@end

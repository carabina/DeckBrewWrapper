#import <Foundation/Foundation.h>

@interface DBCardSet : NSObject

@property (nonatomic, strong, readonly) NSString *identifier;
@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, strong, readonly) NSString *border;
@property (nonatomic, strong, readonly) NSString *type;

@end

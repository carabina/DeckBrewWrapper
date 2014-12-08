#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, DBResponseSerializer) {
    DBResponseSerializerCard = 1,
    DBResponseSerializerCards,
    DBResponseSerializerSet,
    DBResponseSerializerSets
};

@class DBRequest;

@interface DBResponse : NSObject

- (instancetype)initWithResponseObject:(id)responseObject;
- (void)serializeResponseForRequest:(DBRequest *)request
                            success:(void (^)(DBRequest *request, id object))success;

@end

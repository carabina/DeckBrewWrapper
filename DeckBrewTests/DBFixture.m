#import "DBFixture.h"

@implementation DBFixture

+ (id)fixtureFromJSONFile:(NSString *)fileName
{
    NSBundle *currentBundle = [NSBundle bundleForClass:[self class]];
    NSString *filePath = [currentBundle pathForResource:fileName ofType:@"json"];
    NSData *jsonData = [[NSData alloc] initWithContentsOfFile:filePath];
    
    NSAssert(jsonData, @"Error: JSON data cannot be nil. Is the filename right?");
    
    id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData
                                                    options:0
                                                      error:nil];
    
    NSAssert(jsonObject, @"Error: JSON serialization failed. Make sure the JSON is valid.");
    
    return jsonObject;
}

@end

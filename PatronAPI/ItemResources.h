#import <Foundation/Foundation.h>
#import "ItemResource.h"
#import "ItemResourceChildren.h"
#import "ItemResourceCopyStatus.h"

typedef void (^ItemResourceResult)(ItemResource*);
typedef void (^ItemResultChildrenResult)(ItemResourceChildren*);
typedef void (^DeleteItemResourceResult)(BOOL);
typedef void (^ItemResourceCopyResult)(ItemResourceCopyStatus*);

@interface ItemResources : NSObject

- (void)getItemResource:(NSString*)itemId
        withCallback:(ItemResourceResult)callback;

- (void)getItemResourceChildren:(NSString*)itemId
        withCallback:(ItemResultChildrenResult)callback;

- (void)createItemResource:(NSString*)name
        withParentId:(NSString*)parentId
        withItemData:(NSDictionary*)itemData
        withCallback:(ItemResourceResult)callback;

- (void)uploadFile:(NSString*)name
        withParentId:(NSString*)parentId
        withItemData:(NSDictionary*)itemData
        withCallback:(ItemResource*)callback;

- (void)deleteItemResource:(NSString*)itemId
        withCallback:(DeleteItemResourceResult)callback;

- (void)moveItemResource:(NSString*)itemId
        withItemData:(NSDictionary*)itemData
        withCallback:(ItemResourceResult)callback;

// TODO: Create appropriate response objects.
- (void)copyItemResource:(NSString*)itemId
        withItemData:(NSDictionary*)itemData
        withCallback:(ItemResourceCopyResult)callback;

- (void)getItemResourceCopyStatus:(NSObject*)copyItemResourceResult
        withCallback:(ItemResourceCopyResult)callback;

- (NSObject*)requestItemResourceDownload:(NSString*)itemId;
- (NSObject*)downloadItemResourceContents:(NSObject*)downloadRequest;

- (NSObject*)search:(NSString*)searchToken withFolder:(NSString*)folderId;
- (NSObject*)getChanges:(NSString*)itemId;
- (NSObject*)getItemResourceThumbnails:(NSString*)itemId;

// TODO: Create wrappers for creating folders, uploading files, etc.

@end

#import <Foundation/Foundation.h>
#import "ItemResource.h"
#import "ItemResourceChildren.h"

@interface ItemResources : NSObject

- (ItemResource*)getItemResource:(NSString*)itemId;
- (ItemResourceChildren*)getItemResourceChildren:(NSString*)itemId;
- (ItemResource*)createItemResource:(NSString*)name withParentId:(NSString*)parentId withItemData:(NSDictionary*)itemData;
- (ItemResource*)uploadFile:(NSString*)name withParentId:(NSString*)parentId withItemData:(NSDictionary*)itemData;
- (BOOL)deleteItemResource:(NSString*)itemId;
- (ItemResource*)moveItemResource:(NSString*)itemId withItemData:(NSDictionary*)itemData;

// TODO: Create appropriate response objects.
- (NSObject*)copyItemResource:(NSString*)itemId withItemData:(NSDictionary*)itemData;
- (NSObject*)getItemResourceCopyStatus:(NSObject*)copyItemResourceResult;

- (NSObject*)requestItemResourceDownload:(NSString*)itemId;
- (NSObject*)downloadItemResourceContents:(NSObject*)downloadRequest;

- (NSObject*)search:(NSString*)searchToken withFolder:(NSString*)folderId;
- (NSObject*)getChanges:(NSString*)itemId;
- (NSObject*)getItemResourceThumbnails:(NSString*)itemId;

// TODO: Create wrappers for creating folders, uploading files, etc.

@end

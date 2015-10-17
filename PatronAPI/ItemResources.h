#import <Foundation/Foundation.h>
#import "ItemResource.h"
#import "ItemResourceChildren.h"
#import "ItemResourceCopyStatus.h"
#import "ItemResourceDownloadRequest.h"
#import "ItemResourceContents.h"
#import "ItemResourceSearch.h"
#import "ItemResourceChanges.h"
#import "ItemResourceThumbnails.h"

typedef void (^ItemResourceResult)(ItemResource*);
typedef void (^ItemResultChildrenResult)(ItemResourceChildren*);
typedef void (^DeleteItemResourceResult)(BOOL);
typedef void (^ItemResourceCopyResult)(ItemResourceCopyStatus*);
typedef void (^ItemResourceDownloadRequestResult)(ItemResourceDownloadRequest*);
typedef void (^ItemResourceContentsResult)(ItemResourceContents*);
typedef void (^ItemResourceSearchResult)(ItemResourceSearch*);
typedef void (^ItemResourceChangesResult)(ItemResourceChanges*);
typedef void (^ItemResourceThumbnailsResult)(ItemResourceThumbnails*);

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

- (void)copyItemResource:(NSString*)itemId
        withItemData:(NSDictionary*)itemData
        withCallback:(ItemResourceCopyResult)callback;

- (void)getItemResourceCopyStatus:(NSObject*)copyItemResourceResult
        withCallback:(ItemResourceCopyResult)callback;

- (void)requestItemResourceDownload:(NSString*)itemId
        withCallback:(ItemResourceDownloadRequestResult)callback;

- (void)downloadItemResourceContents:(NSObject*)downloadRequest
        withCallback:(ItemResourceContentsResult)callback;

- (void)search:(NSString*)searchToken
        withFolder:(NSString*)folderId
        withCallback:(ItemResourceSearchResult)callback;

- (void)getChanges:(NSString*)itemId
       withCalback:(ItemResourceChangesResult)callback;

- (void)getItemResourceThumbnails:(NSString*)itemId
        withCallback:(ItemResourceThumbnailsResult)callback;

// TODO: Create wrappers for creating folders, uploading files, etc.

@end

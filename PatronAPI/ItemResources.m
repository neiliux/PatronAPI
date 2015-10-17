#import "ItemResources.h"

@implementation ItemResources

- (void)getItemResource:(NSString*)itemId
        withCallback:(ItemResourceResult)callback {
}

- (void)getItemResourceChildren:(NSString*)itemId
        withCallback:(ItemResultChildrenResult)callback {
    [NSException raise:@"not implemented" format:@""];
}

- (void)createItemResource:(NSString*)name
        withParentId:(NSString*)parentId
        withItemData:(NSDictionary*)itemData
              withCallback:(ItemResourceResult)callback {
    [NSException raise:@"not implemented" format:@""];
}

- (void)uploadFile:(NSString*)name
      withParentId:(NSString*)parentId
      withItemData:(NSDictionary*)itemData
      withCallback:(ItemResource*)callback {
    [NSException raise:@"not implemented" format:@""];
}

- (void)deleteItemResource:(NSString*)itemId
        withCallback:(DeleteItemResourceResult)callback {
    [NSException raise:@"not implemented" format:@""];
}

- (void)moveItemResource:(NSString*)itemId
        withItemData:(NSDictionary*)itemData
        withCallback:(ItemResourceResult)callback {
    [NSException raise:@"not implemented" format:@""];
}

- (void)copyItemResource:(NSString*)itemId
        withItemData:(NSDictionary*)itemData
        withCallback:(ItemResourceCopyResult)callback {
    [NSException raise:@"not implemented" format:@""];
}

- (void)getItemResourceCopyStatus:(NSObject*)copyItemResourceResult
        withCallback:(ItemResourceCopyResult)callback {
    [NSException raise:@"not implemented" format:@""];
}

- (void)requestItemResourceDownload:(NSString*)itemId
        withCallback:(ItemResourceDownloadRequestResult)callback {
    [NSException raise:@"not implemented" format:@""];
}

- (void)downloadItemResourceContents:(NSObject*)downloadRequest
        withCallback:(ItemResourceContentsResult)callback {
    [NSException raise:@"not implemented" format:@""];
}

- (void)search:(NSString*)searchToken
        withFolder:(NSString*)folderId
        withCallback:(ItemResourceSearchResult)callback {
    [NSException raise:@"not implemented" format:@""];
}

- (void)getChanges:(NSString*)itemId
        withCalback:(ItemResourceChangesResult)callback {
    [NSException raise:@"not implemented" format:@""];
}

- (void)getItemResourceThumbnails:(NSString*)itemId
        withCallback:(ItemResourceThumbnailsResult)callback {
    [NSException raise:@"not implemented" format:@""];
}

@end

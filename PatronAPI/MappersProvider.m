#import "MappersProvider.h"
#import "Drive.h"
#import "User.h"
#import "DriveQuota.h"
#import "NSDataJsonToNSDictionary.h"
#import "ItemResource.h"
#import "FileSystemInfo.h"
#import "Folder.h"

@implementation MappersProvider {
@private
    NSDataJsonToNSDictionary* jsonToDictionary;
}

-(instancetype)initWith:(NSDataJsonToNSDictionary *)mapper {
    self = [super init];
    
    if (self) {
        self->jsonToDictionary = mapper;
    }
    
    return self;
}

-(Drive*)mapToDrive:(NSData *)jsonData {
    NSDictionary* dict = [self->jsonToDictionary mapToNSDictionary:jsonData];
    
    Drive* drive = [[Drive alloc] init];
    drive.odataContext = [dict objectForKey:@"@odata.context"];
    drive.driveType = [dict objectForKey:@"driveType"];
    drive.id = [dict objectForKey:@"id"];
    
    drive.owner = [self mapToUser:[[dict objectForKey:@"owner"] objectForKey:@"user"]];
    drive.quota = [self mapToDriveQuota:[dict objectForKey:@"quota"]];
    
    return drive;
}

-(ItemResource*)mapToItemResource:(NSData *)jsonData {
    NSDictionary* dict = [self->jsonToDictionary mapToNSDictionary:jsonData];
    ItemResource* itemResource = [self mapDictionaryToItemResource:dict];
    return itemResource;
}

-(ItemResourceChildren*)mapToItemResourceChildren:(NSData *)jsonData {
    NSDictionary* dict = [self->jsonToDictionary mapToNSDictionary:jsonData];
    
    ItemResourceChildren* children = [[ItemResourceChildren alloc] init];
    children.odataContext = [dict objectForKey:@"odata.context"];
    
    NSMutableArray* childResources = [[NSMutableArray alloc] init];
    NSArray* jsonChildren = [dict objectForKey:@"value"];
    
    for (NSDictionary* childDict in jsonChildren) {
        ItemResource* childResource = [self mapDictionaryToItemResource:childDict];
        [childResources addObject:childResource];
    }
    
    children.children = [childResources copy];
    
    return children;
}

-(User*)mapToUser:(NSDictionary *)userData {
    User* user = [[User alloc] init];
    
    user.displayName = [userData objectForKey:@"displayName"];
    user.id = [userData objectForKey:@"id"];

    return user;
}

-(DriveQuota*)mapToDriveQuota:(NSDictionary *)driveQuotaData {
    DriveQuota* driveQuota = [[DriveQuota alloc] init];
    
    driveQuota.deletedSize = [driveQuotaData objectForKey:@"deleted"];
    driveQuota.remainingSize = [driveQuotaData objectForKey:@"remaining"];
    driveQuota.state = [driveQuotaData objectForKey:@"state"];
    driveQuota.total = [driveQuotaData objectForKey:@"total"];
    driveQuota.used = [driveQuotaData objectForKey:@"used"];

    return driveQuota;
}

-(LastModifiedBy*)mapToLastModifiedBy:(NSDictionary*)lastModifiedData {
    LastModifiedBy* lastModifiedBy = [[LastModifiedBy alloc] init];
    
    if (lastModifiedData == nil) {
        return lastModifiedBy;
    }
    
    NSDictionary* application = [lastModifiedData objectForKey:@"application"];
    if (application != nil) {
        lastModifiedBy.application = [self mapToUser:application];
    }
    
    NSDictionary* user = [lastModifiedData objectForKey:@"user"];
    if (user != nil) {
        lastModifiedBy.user = [self mapToUser:user];
    }
    
    return lastModifiedBy;
}

-(Folder*)mapToFolder:(NSDictionary*)folderData {
    Folder* folder = [[Folder alloc] init];
    
    if (folderData != nil) {
        folder.childCount = [folderData objectForKey:@"childCount"];
    }
    
    return folder;
}

-(FileSystemInfo*)mapToFileSystemInfo:(NSDictionary*)fileSystemInfoData {
    FileSystemInfo* fileSystemInfo = [[FileSystemInfo alloc] init];
    
    if (fileSystemInfoData == nil) {
        return fileSystemInfo;
    }
    
    fileSystemInfo.createdDateTime = [fileSystemInfoData objectForKey:@"createdDateTime"];
    fileSystemInfo.lastModifiedDateTime = [fileSystemInfoData objectForKey:@"lastModifiedDateTime"];
    
    return fileSystemInfo;
}

-(ParentReference*)mapToParentReference:(NSDictionary*)parentReferenceData {
    ParentReference* parentReference = [[ParentReference alloc] init];
    
    if (parentReferenceData == nil) {
        return parentReference;
    }
    
    parentReference.driveId = [parentReferenceData objectForKey:@"driveId"];
    parentReference.id = [parentReferenceData objectForKey:@"id"];
    parentReference.path = [parentReferenceData objectForKey:@"path"];
    
    return parentReference;
}

-(ItemResource*)mapDictionaryToItemResource:(NSDictionary *)dict {
    ItemResource* itemResource = [[ItemResource alloc] init];
    
    itemResource.odataContext = [dict objectForKey:@"@odata.context"];
    itemResource.id = [dict objectForKey:@"id"];
    itemResource.name = [dict objectForKey:@"name"];
    itemResource.eTag = [dict objectForKey:@"eTag"];
    itemResource.cTag = [dict objectForKey:@"cTag"];
    itemResource.createdBy = [self mapToUser:[[dict objectForKey:@"createdBy"] objectForKey:@"user"]];
    itemResource.createdDateTime = [dict objectForKey:@"createdDateTime"];
    itemResource.lastModifiedBy = [self mapToLastModifiedBy:[dict objectForKey:@"lastModifiedBy"]];
    itemResource.lastModifiedDateTime = [dict objectForKey:@"lastModifiedDateTime"];
    itemResource.size = [dict objectForKey:@"size"];
    itemResource.webUrl = [dict objectForKey:@"webUrl"];
    itemResource.parentReference = [dict objectForKey:@"parentReference"];
    itemResource.folder = [self mapToFolder:[dict objectForKey:@"folder"]];
    itemResource.fileSystemInfo = [self mapToFileSystemInfo:[dict objectForKey:@"fileSystemInfo"]];
    
    return itemResource;
}

@end

#import "MappersProvider.h"
#import "Drive.h"
#import "User.h"
#import "DriveQuota.h"
#import "NSDataJsonToNSDictionary.h"

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

@end

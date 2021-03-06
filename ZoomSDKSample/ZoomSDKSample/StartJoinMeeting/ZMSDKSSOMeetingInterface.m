//
//  ZMSDKSSOMeetingInterface.m
//  ZoomSDKSample
//
//  Created by derain on 2018/11/26.
//  Copyright © 2018年 zoom.us. All rights reserved.
//

#import "ZMSDKSSOMeetingInterface.h"

@implementation ZMSDKSSOMeetingInterface
- (id)init
{
    self = [super init];
    if(self)
    {
        return self;
    }
    return nil;
}

-(void)cleanUp
{
    return;
}
- (void)dealloc
{
    [self cleanUp];
    [super dealloc];
}
- (ZoomSDKError)startVideoMeetingForSSOUser
{
    ZoomSDKMeetingService* meetingService = [[ZoomSDK sharedSDK] getMeetingService];
    if (meetingService)
    {
        ZoomSDKStartMeetingElements *joinParams = [[[ZoomSDKStartMeetingElements alloc] init] autorelease];
        joinParams.userType = ZoomSDKUserType_SSOUser;
        joinParams.userId = nil;
        joinParams.displayName = nil;
        joinParams.meetingNumber = 0;
        joinParams.isDirectShare = NO;
        joinParams.displayID = 0;
        joinParams.isNoVideo = NO;
        joinParams.isNoAuido = NO;
        joinParams.vanityID = nil;
        ZoomSDKError ret = [meetingService startMeeting:joinParams];
        return ret;
    }
    return ZoomSDKError_Failed;
}
- (ZoomSDKError)startAudioMeetingForSSOUser
{
    ZoomSDKMeetingService* meetingService = [[ZoomSDK sharedSDK] getMeetingService];
    if (meetingService)
    {
        ZoomSDKStartMeetingElements *joinParams = [[[ZoomSDKStartMeetingElements alloc] init] autorelease];
        joinParams.userType = ZoomSDKUserType_SSOUser;
        joinParams.userId = nil;
        joinParams.displayName = nil;
        joinParams.meetingNumber = 0;
        joinParams.isDirectShare = NO;
        joinParams.displayID = 0;
        joinParams.isNoVideo = YES;
        joinParams.isNoAuido = NO;
        joinParams.vanityID = nil;
        ZoomSDKError ret = [meetingService startMeeting:joinParams];
        return ret;
    }
    return ZoomSDKError_Failed;
}
- (ZoomSDKError)joinMeetingForSSOUser:(NSString*)meetingNumber displayName:(NSString*)name password:(NSString*)psw
{
    ZoomSDKMeetingService* meetingService = [[ZoomSDK sharedSDK] getMeetingService];
    if (meetingService && meetingNumber.length > 0)
    {
        ZoomSDKJoinMeetingElements *joinParams = [[[ZoomSDKJoinMeetingElements alloc] init] autorelease];
        joinParams.userType = ZoomSDKUserType_SSOUser;
        joinParams.webinarToken = nil;
        joinParams.participantId = nil;
        joinParams.meetingNumber = meetingNumber.longLongValue;
        joinParams.displayName = name;
        joinParams.password = psw;
        joinParams.isDirectShare = NO;
        joinParams.displayID = 0;
        joinParams.isNoVideo = NO;
        joinParams.isNoAuido = NO;
        joinParams.vanityID = nil;
        ZoomSDKError ret = [meetingService joinMeeting:joinParams];
        return ret;
    }
    return ZoomSDKError_Failed;
}

@end

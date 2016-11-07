//
//  HRPGNotificationManager.m
//  Habitica
//
//  Created by Phillip Thelen on 02/11/2016.
//  Copyright © 2016 Phillip Thelen. All rights reserved.
//

#import "HRPGNotificationManager.h"
#import "HRPGBaseNotificationView.h"
#import "HRPGDropsEnabledNotification.h"
#import "HRPGStreakAchievementNotification.h"

@interface HRPGNotificationManager ()

@property HRPGNotification *currentNotification;

@property NSMutableArray *notificationqueue;

@property (weak) HRPGManager *sharedManager;

@end

@implementation HRPGNotificationManager

- (instancetype)initWithSharedManager:(HRPGManager *)sharedManager {
    self = [super init];
    if (self) {
        self.sharedManager = sharedManager;
        self.notificationqueue = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)enqueueNotification:(HRPGNotification *)notification {
    for (HRPGNotification *oldNotification in self.notificationqueue) {
        if ([oldNotification.id isEqualToString:notification.id]) {
            return;
        }
    }
    
    [self.notificationqueue addObject:notification];
    
    if (self.currentNotification == nil) {
        [self displayNextNotification];
    }
}

- (void)enqueueNotifications:(NSArray *)notifications {
    for (HRPGNotification *notification in notifications) {
        [self enqueueNotification:notification];
    }
}

- (void)displayNextNotification {
    if (self.notificationqueue.count < 1) {
        return;
    }
    self.currentNotification = [self.notificationqueue firstObject];
    [self.notificationqueue removeObjectAtIndex:0];
    
    
    HRPGBaseNotificationView *notificationView = nil;
    if ([self.currentNotification.type isEqualToString:@"DROPS_ENABLED"]) {
        notificationView = [[HRPGDropsEnabledNotification alloc] init];
    } else if ([self.currentNotification.type isEqualToString:@"STREAK_ACHIEVEMENT"]) {
        HRPGStreakAchievementNotification *notif = [[HRPGStreakAchievementNotification alloc] init];
        notif.user = [self.sharedManager getUser];
        notificationView = notif;
    }
    
    if (notificationView == nil) {
        self.currentNotification = nil;
        return;
    }
    
    __weak HRPGNotificationManager *weakSelf = self;
    notificationView.notification = self.currentNotification;
    [notificationView displayNotification:^{
        [self.sharedManager markNotificationRead:self.currentNotification onSuccess:nil onError:nil];
        weakSelf.currentNotification = nil;
        [weakSelf displayNextNotification];
    }];
}

@end

//
//  AppDelegate.h
//  FootMap
//
//  Created by davidBear on 14-3-24.
//  Copyright (c) 2014年 Atirun. All rights reserved.
//


#import <UIKit/UIKit.h>

@class  ZUUIRevealController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (strong, nonatomic) ZUUIRevealController *bothSidesController;


- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end

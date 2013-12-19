//
// Created by Martin Gagnon on 12/4/2013.
// Copyright (c) 2013 Mirego. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "MRGControlPanelPlugin.h"

@interface MRGControlPanelPluginMock : NSObject <MRGControlPanelPlugin>
@property (nonatomic, strong) NSString * displayName;
@property (nonatomic, weak) id<MRGControlPanelPluginDelegate> delegate;
@property (nonatomic, readonly) NSString * lastCalledSupportPath;
@property (nonatomic, readonly) NSString * lastCalledViewControllerPath;

- (void)sendData;
@end
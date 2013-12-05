//
// Created by Martin Gagnon on 12/4/2013.
// Copyright (c) 2013 Mirego. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "MRGControlPanel/MRGControlPanelPlugin.h"

@interface MRGControlPanelPluginMock : NSObject <MRGControlPanelPlugin>
@property (nonatomic, strong) NSString * displayName;
@property (nonatomic, weak) id<MRGControlPanelPluginDelegate> delegate;

- (void)sendData;
@end
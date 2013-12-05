//
// Created by Martin Gagnon on 12/4/2013.
// Copyright (c) 2013 Mirego. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "MRGControlPanelPlugin.h"

@interface MRGControlPanelSamplePlugin : NSObject <MRGControlPanelPlugin>
@property (nonatomic, readonly) NSString * displayName;

+ (id <MRGControlPanelPlugin>)plugin;

@end
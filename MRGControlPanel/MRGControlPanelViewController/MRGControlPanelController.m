//
// Created by Martin Gagnon on 12/4/2013.
// Copyright (c) 2013 Mirego. All rights reserved.
//


#import <MessageUI/MessageUI.h>
#import "MRGControlPanelController.h"
#import "MRGControlPanelPlugin.h"


@interface MRGControlPanelController () <MRGControlPanelPluginDelegate>
@end

@implementation MRGControlPanelController {
NSArray* _plugins;
}
- (id)initWithPlugins:(NSArray *)plugins {
    self = [super init];
    if (self) {
        _plugins = plugins;
    }
    return self;
}

- (id <MRGControlPanelPlugin>)pluginAtIndex:(NSUInteger)index {
    id <MRGControlPanelPlugin> plugin = [_plugins objectAtIndex:index];
    plugin.delegate = self;
    return plugin;
}

- (UIViewController *)viewControllerForPluginAtIndex:(NSUInteger)index {
    return [self pluginAtIndex:index].viewController;
}

//------------------------------------------------------------------------------
#pragma mark MRGControlPanelPluginDelete
//------------------------------------------------------------------------------
- (void)plugin:(id <MRGControlPanelPlugin>)mock requestReportOfData:(NSData *)data additionalInfo:(NSDictionary *)info {
    MFMailComposeViewController * composer = [[MFMailComposeViewController alloc] init];
    [self.delegate shouldPresentViewController:composer];
}


@end
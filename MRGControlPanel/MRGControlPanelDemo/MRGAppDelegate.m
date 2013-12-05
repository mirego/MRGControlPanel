//
//  MRGAppDelegate.m
//  MRGControlPanelDemo
//
//  Created by Dany L'Hebreux on 2013-12-04.
//  Copyright (c) 2013 Mirego. All rights reserved.
//

#import "MRGAppDelegate.h"
#import "MRGControlPanel.h"
#import "MRGControlPanelSamplePlugin.h"

@implementation MRGAppDelegate {
    MRGControlPanel * _panel;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self showControlPanel];

    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    if ([MRGControlPanel isControlPanelURL:url]) {
        [self showControlPanel];
    }
    return YES;
}

- (void)showControlPanel {
    _panel = [MRGControlPanel controlPanel];
    [_panel addPlugin:[MRGControlPanelSamplePlugin plugin]];
    self.window.rootViewController = [_panel rootViewController];
    [self.window makeKeyAndVisible];
}

@end

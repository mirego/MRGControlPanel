//
//  MRGControlPanel.m
//  MRGControlPanelDemo
//
//  Created by Dany L'Hebreux on 2013-12-04.
//  Copyright (c) 2013 Mirego. All rights reserved.
//

#import "MRGControlPanel.h"
#import "MRGControlPanelPlugin.h"
#import "MRGControlPanelViewController.h"

@implementation MRGControlPanel {
    NSMutableArray * _plugins;
    UIViewController * _rootViewController;
}

//------------------------------------------------------------------------------
#pragma mark Constructor
//------------------------------------------------------------------------------
- (id)init {
    self = [super init];
    if (self) {
        _plugins = [[NSMutableArray alloc] initWithCapacity:5];
    }

    return self;
}

+ (BOOL)isControlPanelURL:(NSURL *)url {
    NSString *validRouteRegex = @"^.*:\\/\\/panel$";
    return  ([url.absoluteString rangeOfString:validRouteRegex options:NSRegularExpressionSearch].location != NSNotFound);
}

+ (MRGControlPanel *)controlPanel {
    return [[MRGControlPanel alloc] init];
}

//------------------------------------------------------------------------------
#pragma mark Plugins modifier
//------------------------------------------------------------------------------
- (void)addPlugin:(id <MRGControlPanelPlugin>)plugin {
    [_plugins addObject:plugin];
}

//------------------------------------------------------------------------------
#pragma mark Property getter/setter
//------------------------------------------------------------------------------
- (NSUInteger)pluginsCount {
    return [_plugins count];
}

- (UIViewController *)rootViewController {
    if (!_rootViewController) {
        _rootViewController = [[MRGControlPanelViewController alloc] init];
    }
    return _rootViewController;
}


@end

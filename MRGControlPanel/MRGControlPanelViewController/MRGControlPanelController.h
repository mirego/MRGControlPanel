//
// Created by Martin Gagnon on 12/4/2013.
// Copyright (c) 2013 Mirego. All rights reserved.
//


#import <Foundation/Foundation.h>

@protocol MRGControlPanelPlugin;

@protocol MRGControlPanelControllerDelegate;

@interface MRGControlPanelController : NSObject
@property (nonatomic, readonly) NSUInteger pluginCount;

@property(nonatomic, weak) id<MRGControlPanelControllerDelegate> delegate;

- (id<MRGControlPanelPlugin>) pluginAtIndex:(NSUInteger) index;
- (id)initWithPlugins:(NSArray *)plugins;

- (UIViewController *)viewControllerForPluginAtIndex:(NSUInteger)index;
@end

@protocol MRGControlPanelControllerDelegate
- (void) shouldPresentViewController:(UIViewController *) viewController;
@end

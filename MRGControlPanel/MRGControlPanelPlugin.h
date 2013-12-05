//
//  MRGControlPanelPlugin.h
//  MRGControlPanelDemo
//
//  Created by Dany L'Hebreux on 2013-12-04.
//  Copyright (c) 2013 Mirego. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MRGControlPanelPluginDelegate;

@protocol MRGControlPanelPlugin <NSObject>
@property (nonatomic, readonly) NSString * displayName;
@property (nonatomic, weak) id<MRGControlPanelPluginDelegate> delegate;

+ (id <MRGControlPanelPlugin>)plugin; // New instance of the plugin
- (UIViewController *)viewController; // New instance of the plugin's view controller

@end

@protocol MRGControlPanelPluginDelegate
- (void)plugin:(id <MRGControlPanelPlugin>)mock requestReportOfData:(NSData *)data additionalInfo:(NSDictionary *)info;
@end

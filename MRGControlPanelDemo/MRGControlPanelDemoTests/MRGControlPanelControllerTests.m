//
// Created by Martin Gagnon on 12/4/2013.
// Copyright (c) 2013 Mirego. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <MessageUI/MessageUI.h>
#import "MRGControlPanel/MRGControlPanelController.h"
#import "MRGControlPanelSamplePlugin.h"
#import "MRGControlPanelPluginMock.h"

@interface MRGControlPanelControllerTests : XCTestCase <MRGControlPanelControllerDelegate>
@end

@implementation MRGControlPanelControllerTests {
    MRGControlPanelController * _controller;
    NSArray * _plugins;
    UIViewController * _askedPresentedViewController;
}

- (void)setUp {
    [super setUp];

    MRGControlPanelPluginMock * mock1 = [[MRGControlPanelPluginMock alloc] init];
    mock1.displayName = @"MOCK1";
    MRGControlPanelPluginMock * mock2 = [[MRGControlPanelPluginMock alloc] init];
    mock2.displayName = @"MOCK2";

    _plugins = @[mock1,mock2];
    _controller = [[MRGControlPanelController alloc] initWithPlugins:_plugins deviceId:@""];
}


- (void) testCanGetPluginCount {
    XCTAssert(2 == _controller.pluginCount);
}

- (void) testCanGetPlugin {
    id<MRGControlPanelPlugin> plugin = [_controller pluginAtIndex:0];
    id<MRGControlPanelPlugin> referencePlugin = _plugins[0];
    XCTAssertEqualObjects(referencePlugin.displayName, plugin.displayName);
    plugin = [_controller pluginAtIndex:1];
    referencePlugin = _plugins[1];
    XCTAssertEqualObjects(referencePlugin.displayName, plugin.displayName);
}

- (void) testCanGetControllerPlugin {
    UIViewController * viewController = [_controller viewControllerForPluginAtIndex:0];
    id<MRGControlPanelPlugin> referencePlugin = _plugins[0];

    XCTAssertEqualObjects(referencePlugin.viewController, viewController);
}

- (void) testCanSetPluginDelegate {
    id<MRGControlPanelPlugin> plugin = [_controller pluginAtIndex:0];
    XCTAssertEqualObjects(_controller, plugin.delegate);
}

- (void) testCanReceiveDataFromPlugin {
    _controller.delegate = self;
    MRGControlPanelPluginMock * plugin = (MRGControlPanelPluginMock *)[_controller pluginAtIndex:0];
    [plugin sendData];
    XCTAssert([_askedPresentedViewController isKindOfClass:[MFMailComposeViewController class]]);
}

- (void)shouldPresentMailComposer:(MFMailComposeViewController *)viewController {
    _askedPresentedViewController = viewController;
}

@end
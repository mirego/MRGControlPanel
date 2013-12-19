//
// Created by Martin Gagnon on 12/4/2013.
// Copyright (c) 2013 Mirego. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MRGControlPanelSamplePlugin.h"
#import "MRGControlPanel.h"
#import "MRGControlPanelPluginMock.h"

@interface MRGControlPanelTests : XCTestCase
@end


@implementation MRGControlPanelTests {
MRGControlPanel * _controlPanel;
}

- (void)setUp {
    [super setUp];

    _controlPanel = [MRGControlPanel controlPanel];
}


- (void) testCanValidateRouteName {
    NSURL * route = [NSURL URLWithString:@"myAppName://scp"];
    BOOL shouldNotBeAValidRoute = [MRGControlPanel isControlPanelURL:route];
    XCTAssert(!shouldNotBeAValidRoute);

    route = [NSURL URLWithString:@"myAppName://panel"];
    BOOL shouldBeAValidRoute = [MRGControlPanel isControlPanelURL:route];
    XCTAssert(shouldBeAValidRoute);

    route = [NSURL URLWithString:@"myOtherAppName://panel"];
    shouldBeAValidRoute = [MRGControlPanel isControlPanelURL:route];
    XCTAssert(shouldBeAValidRoute);

    route = [NSURL URLWithString:@"myOtherAppName://panel/test"];
    shouldBeAValidRoute = [MRGControlPanel isControlPanelURL:route];
    XCTAssert(shouldBeAValidRoute);

    route = [NSURL URLWithString:@"myOtherAppName://panel22/test"];
    shouldBeAValidRoute = [MRGControlPanel isControlPanelURL:route];
    XCTAssert(!shouldBeAValidRoute);
}

- (void) testCanRegisterPlugin {
    id<MRGControlPanelPlugin> plugin = [MRGControlPanelSamplePlugin plugin];
    [_controlPanel addPlugin:plugin];
    XCTAssert([_controlPanel pluginsCount] == 1);
}

- (void) testCannotRegisterAnInvalidPlugin {
    [_controlPanel addPlugin:nil];
    XCTAssert([_controlPanel pluginsCount] == 0);
    [_controlPanel addPlugin:(id<MRGControlPanelPlugin>)[[NSObject alloc]init]];
    XCTAssert([_controlPanel pluginsCount] == 0);
}


- (void) testCanGetRootViewController {
    UIViewController * viewController = _controlPanel.rootViewController;
    XCTAssert(viewController);
    XCTAssert([viewController isKindOfClass:[UIViewController class]]);
}

- (void) testCanGetUniqueDeviceIdentifier {
    NSString * id1 = _controlPanel.deviceId;
    NSString * id2 = _controlPanel.deviceId;
    XCTAssert(id1);
    XCTAssert([id1 isEqualToString:id2]);
}

- (void) testCanOpenSpecificURL {
    MRGControlPanelPluginMock * mock = [MRGControlPanelPluginMock plugin];
    [_controlPanel addPlugin:mock];
    [_controlPanel openURL:[NSURL URLWithString:@"foo://panel/mock"]];
    XCTAssert([mock.lastCalledSupportPath isEqualToString:@"/mock"]);
    XCTAssert([mock.lastCalledViewControllerPath isEqualToString:@"/mock"]);

}

@end
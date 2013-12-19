//
// Created by Martin Gagnon on 12/4/2013.
// Copyright (c) 2013 Mirego. All rights reserved.
//


#import "MRGControlPanelPluginMock.h"


@implementation MRGControlPanelPluginMock {
UIViewController * _viewController;

}

+ (id <MRGControlPanelPlugin>)plugin {
    return [[MRGControlPanelPluginMock alloc] init];
}

- (UIViewController *)viewController {
    if(!_viewController) {
        _viewController = [[UIViewController alloc] init];
    }
    return _viewController;
}

- (BOOL) supportsPath:(NSString *) path {
    _lastCalledSupportPath = path;
    NSArray * paths = [path componentsSeparatedByString:@"/"];
    return (paths.count > 1 && [paths[1] isEqualToString:@"mock"]);
}

- (UIViewController *)viewControllerForPath:(NSString *)path {
    _lastCalledViewControllerPath = path;
    return [[UIViewController alloc] init];
}


- (void)sendData {
    NSData * data = [@"My Data Is a String" dataUsingEncoding:NSUTF8StringEncoding];
    [self.delegate plugin:self requestReportOfData:data filename:@"test.data" additionalInfo:@{@"foo":@"bar",@"foobar":@"buzz"}];
}

@end


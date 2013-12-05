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


- (void)sendData {
    NSData * data = [@"My Data Is a String" dataUsingEncoding:NSUTF8StringEncoding];
    [self.delegate plugin:self requestReportOfData:data additionalInfo:@{@"foo":@"bar",@"foobar":@"buzz"}];
}

@end


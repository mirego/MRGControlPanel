//
// Created by Martin Gagnon on 12/4/2013.
// Copyright (c) 2013 Mirego. All rights reserved.
//


#import "MRGControlPanelSamplePlugin.h"

@interface MRGControlPanelSamplePlugin ()
@end

@implementation MRGControlPanelSamplePlugin {
}

- (id) init {
    self = [super init];
    if (self) {
        self.title = @"Sample plugin";
    }
    return self;
}

+ (id <MRGControlPanelPlugin>)plugin {
    return [[MRGControlPanelSamplePlugin alloc] init];
}

- (void)loadView {
    [super loadView];
    UIButton * button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self action:@selector(sendData:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Press to send data" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor grayColor];
    button.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    button.frame = CGRectMake(50, 50, 150, 50);

    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0,0,400,200)];
    [view addSubview:button];

    self.view = view;
}

- (void)sendData:(id)sendData {
    NSData * MyData = [@"My Sample Plugin Data" dataUsingEncoding:NSUTF8StringEncoding];
    [_delegate plugin:self requestReportOfData:MyData filename:@"data.log" additionalInfo:@{@"foo":@"bar",@"foobar":@"buzz"}];
}

- (NSString *)displayName {
    return self.title;
}

- (UIViewController *)viewController {
    return self;
}

@end
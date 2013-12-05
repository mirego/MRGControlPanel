//
//  ControlPanelTests.m
//  MRGControlPanelDemo
//
//  Created by Dany L'Hebreux on 2013-12-04.
//  Copyright (c) 2013 Mirego. All rights reserved.
//

#import "Kiwi.h"
#import "MRGControlPanel.h"

SPEC_BEGIN(ControlPanel)

describe(@"ControlPanel", ^{
    
    describe(@"instance methods", ^{
        
        __block MRGControlPanel *controlPanel;
        
        beforeEach(^{
            controlPanel = [[MRGControlPanel alloc] init];
        });
        
        specify(^{
            [[controlPanel should] respondToSelector:@selector(addPlugin:)];
        });

    });
    
    describe(@"add plugin object", ^{
        
        __block MRGControlPanel *controlPanel;
        
        beforeEach(^{
            controlPanel = [[MRGControlPanel alloc] init];
            [controlPanel addPlugin:nil];
        });
        
    });
    
    
});



SPEC_END

# MRGControlPanel
The Control panel of your dream

### Installation with CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries like this super control panel in your projects.

#### Podfile

```ruby
platform :ios, '7.0'
pod TODO
```

#### Project Setup

```objective-c
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    if ([MRGControlPanel isControlPanelURL:url]) {
	    _panel = [MRGControlPanel controlPanel];
    	[_panel addPlugin:[MRGControlPanelSamplePlugin plugin]];
	    self.window.rootViewController = [_panel rootViewController];
	    [self.window makeKeyAndVisible];
    }
    return YES;
}
```

#### Plugin how to

* Add MRGControlPanel as a dependency in your project
* Create a class that implement MRGControlPanelPlugin protocol
* [_panel addPlugin:[YourAwesomePlugin plugin]];

See MRGControlPanelSamplePlugin.

## License

MRGControlPanel is © 2016 [Mirego](http://www.mirego.com) and may be freely
distributed under the [New BSD license](http://opensource.org/licenses/BSD-3-Clause).
See the [`LICENSE.md`](https://github.com/mirego/taylor-ios/blob/master/LICENSE.md) file.

## About Mirego

[Mirego](http://mirego.com) is a team of passionate people who believe that work is a place where you can innovate and have fun. We're a team of [talented people](http://life.mirego.com) who imagine and build beautiful Web and mobile applications. We come together to share ideas and [change the world](http://mirego.org).

We also [love open-source software](http://open.mirego.com) and we try to give back to the community as much as we can.


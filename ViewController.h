//
//  ViewController.h
//  iAdAndGLKit
//
//  Created by Jeremy McCulloch on 8/3/15.
//  Copyright © 2015 Jeremy McCulloch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>
#import <iAd/iAd.h>

@interface ViewController : GLKViewController

@property (strong, nonatomic) EAGLContext *context;
@property (strong, nonatomic) ADBannerView *banner;
@property (nonatomic) BOOL bannerIsVisible;

@end

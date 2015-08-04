//
//  ViewController.m
//  iAdAndGLKit
//
//  Created by Jeremy McCulloch on 8/3/15.
//  Copyright © 2015 Jeremy McCulloch. All rights reserved.
//

#import "ViewController.h"
@implementation ViewController
@synthesize context = _context;
@synthesize banner = _banner;
@synthesize bannerIsVisible = _bannerIsVisible;

#pragma mark - iAd
- (void)viewDidAppear:(BOOL)animated
{
    if (([[[UIDevice currentDevice] model]isEqualToString:@"iPhone"] || [[[UIDevice currentDevice] model]isEqualToString:@"iPod touch"])) {
        
        
        [super viewDidAppear:animated];
        ADBannerView *adView = [[ADBannerView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height, 320, 50)];
        adView.delegate=self;
        
        [self.view addSubview:adView];
    }
    else {
        
        
        [super viewDidAppear:animated];
        ADBannerView *adView = [[ADBannerView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height, 480, 66)];
        adView.delegate=self;
        
        [self.view addSubview:adView];
    }
}
- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    NSLog(@"loaded ad");
    
    [UIView beginAnimations:@"animateAdBannerOn" context:NULL];
    
    if (([[[UIDevice currentDevice] model]isEqualToString:@"iPhone"] ||
         [[[UIDevice currentDevice] model]isEqualToString:@"iPod touch"])) {
        banner.frame = CGRectMake(0, self.view.frame.size.height-50, 320, 50);
        
    } else {
        banner.frame = CGRectMake(0, self.view.frame.size.height-66, 480, 66);
    }
    
    [UIView commitAnimations];
    
    _bannerIsVisible = YES;
    
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    NSLog(@"Failed to retrieve ad");
    
    
    [UIView beginAnimations:@"animateAdBannerOff" context:NULL];
    
    if (([[[UIDevice currentDevice] model]isEqualToString:@"iPhone"] ||
         [[[UIDevice currentDevice] model]isEqualToString:@"iPod touch"])) {
        banner.frame = CGRectMake(0, self.view.frame.size.height, 320, 50);
        
    } else {
        banner.frame = CGRectMake(0, self.view.frame.size.height, 480, 66);
    }
    
    [UIView commitAnimations];
    
    _bannerIsVisible = NO;
    
}
#pragma mark - GLKit
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    
    if (!self.context) {
        NSLog(@"Failed to create ES context");
    }
    
    GLKView *view = (GLKView *)self.view;
    view.context = self.context;
    [EAGLContext setCurrentContext:self.context];
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect {
    NSLog(@"Draw");
    glClearColor(0, 104.0/255.0, 55.0/255.0, 1.0);
    glClear(GL_COLOR_BUFFER_BIT);
}

- (void)update {
    NSLog(@"Update");
}

@end

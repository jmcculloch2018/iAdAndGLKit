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

#pragma mark - GLKit
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.canDisplayBannerAds = YES;
    
    self.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    
    if (!self.context) {
        NSLog(@"Failed to create ES context");
    }
    
    GLKView *view = (GLKView *)self.originalContentView;
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

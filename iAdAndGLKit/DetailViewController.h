//
//  DetailViewController.h
//  iAdAndGLKit
//
//  Created by Jeremy McCulloch on 8/3/15.
//  Copyright © 2015 Jeremy McCulloch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end


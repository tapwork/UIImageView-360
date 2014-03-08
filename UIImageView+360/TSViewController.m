//
//  TSViewController.m
//  UIImageView+360
//
//  Created by Christian Menschel on 10/02/14.
//  Copyright (c) 2014 tapwork. All rights reserved.
//

#import "TSViewController.h"
#import "TSImageView360.h"

@interface TSViewController ()

@end

@implementation TSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Create our image collection with 72 images
    int numberOfImages = 72;
    NSMutableArray *images = [@[] mutableCopy];
    for (int i = 1; i <= numberOfImages; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"Seq_v04_640x378_%d.jpg",i]];
        if (image)
        {
            [images addObject:image];
        }
    }
    
    TSImageView360 *imageView = [[TSImageView360 alloc] initWithFrame:self.view.bounds];
    imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.images = images;
    [self.view addSubview:imageView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

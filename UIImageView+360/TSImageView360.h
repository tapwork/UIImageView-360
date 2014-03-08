//
//  TSImageView360.h
//  UIImageView+360
//
//  Created by Christian Menschel on 10/02/14.
//  Copyright (c) 2014 tapwork. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TSImageView360 : UIImageView

/// Provide the images for the 360° image rotation. More images, the better is the animation
@property (nonatomic, strong) NSArray *images;

/// Rotation speed value from 0.1 to 1.0.
/// Default is 1.0 which means that a pan gesture from the left edge to the right edge rotates 360°
@property (nonatomic, assign) float speed;


@end

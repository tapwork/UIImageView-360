//
//  TSImageView360.m
//  UIImageView+360
//
//  Created by Christian Menschel on 10/02/14.
//  Copyright (c) 2014 tapwork. All rights reserved.
//

#import "TSImageView360.h"

@implementation TSImageView360
{
    NSUInteger _currentIndex;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _speed = 1.0;
        _currentIndex = 0;
        self.userInteractionEnabled = YES;
        
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]
                                              initWithTarget:self
                                              action:@selector(panGestureRecognizerAction:)];
        [self addGestureRecognizer:panGesture];
    }
    return self;
}


- (void)setImages:(NSArray *)images
{
    if (![_images isEqual:images]) {
        _images = images;
        self.image = [images firstObject];
    }
}

- (void)panGestureRecognizerAction:(UIPanGestureRecognizer*)panGesture
{
    // Calculate the panned x offset ratio based on our bound's width
    CGPoint translation = [panGesture translationInView:panGesture.view];
    float pannedPart = (translation.x / self.bounds.size.width) * self.speed;
    
    // Invert the pan direction to make the rotation feel more natural
    pannedPart = (-1)*pannedPart;
    
    // Start from the _currentIndex. otherwise we would always start from the first image
    NSUInteger newIndex = _currentIndex;
    
    // Panning from left to right
    if (pannedPart > 0) {
        // Find the index for the current panned part
        newIndex += ([self.images count]*pannedPart);;
    } else {
        // Panning from the left to the right needs an invert again
        pannedPart = (-1) * pannedPart;
        // Find the index for the current panned part
        newIndex += [self.images count] - ([self.images count]*pannedPart);
    }
    
    // If the newIndex is out of bounds, we need start from the beginning + the overhead
    if (newIndex >= [self.images count]) {
        newIndex = newIndex - [self.images count];
    }
    
    // Finally grab the image and set it
    self.image = self.images[newIndex];
    
    if (panGesture.state == UIGestureRecognizerStateEnded) {
        _currentIndex = newIndex;
    }
}

@end

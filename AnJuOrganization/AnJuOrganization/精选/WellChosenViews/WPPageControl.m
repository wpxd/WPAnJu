//
//  WPPageControl.m
//  AnJuChina
//
//  Created by apple on 14-6-24.
//  Copyright (c) 2014年 PengApple. All rights reserved.
//

#import "WPPageControl.h"

@implementation WPPageControl

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.userInteractionEnabled = NO;
    }
    return self;
}
- (void)updateDots
{
    for (int i = 0; i< [self.subviews count]; i++) {
        
        UIImageView *dot = (UIImageView *)[self.subviews objectAtIndex:i];
        
        if (i == self.currentPage)
        {
            
            dot.backgroundColor = [UIColor colorWithRed:251.0/255 green:47.0/255 blue:9.0/255 alpha:1];
            
        }
        
        else
        {
//            dot.backgroundColor = [UIColor whiteColor];
        }
    }
    
}

- (void)setCurrentPage:(NSInteger)currentPage

{
    
    [super setCurrentPage:currentPage];
    
    [self updateDots];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

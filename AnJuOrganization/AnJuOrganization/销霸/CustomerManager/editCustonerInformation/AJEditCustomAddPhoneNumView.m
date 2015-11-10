//
//  AJEditCustomAddPhoneNumView.m
//  AnJuOrganization
//
//  Created by 张旭东 on 15/11/11.
//  Copyright © 2015年 王鹏. All rights reserved.
//

#import "AJEditCustomAddPhoneNumView.h"
@interface AJEditCustomAddPhoneNumView()
@property (nonatomic ,strong)UIView *contentView;
@end
@implementation AJEditCustomAddPhoneNumView
- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        _contentView = [[[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] instantiateWithOwner:self options:nil] objectAtIndex:0];
        CGRect newFrame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        _contentView.frame = newFrame;
        [self addSubview:_contentView];
    }
    return self;
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

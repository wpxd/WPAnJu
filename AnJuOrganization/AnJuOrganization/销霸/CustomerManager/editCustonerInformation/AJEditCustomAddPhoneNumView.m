//
//  AJEditCustomAddPhoneNumView.m
//  AnJuOrganization
//
//  Created by 张旭东 on 15/11/11.
//  Copyright © 2015年 王鹏. All rights reserved.
//

#import "AJEditCustomAddPhoneNumView.h"
@interface AJEditCustomAddPhoneNumView()
<
UITextFieldDelegate
>
@property (nonatomic ,strong)UIView *contentView;
@end
@implementation AJEditCustomAddPhoneNumView
- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        _contentView = [[[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] instantiateWithOwner:self options:nil] objectAtIndex:0];
        CGRect newFrame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        _contentView.frame = newFrame;
//        _contentView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_contentView];
//        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-|_contentView|-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_contentView)]];
//        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-|_contentView|-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_contentView)]];
        [_phoneNumTextField addTarget:self action:@selector(phoneNumTextFieldAction:) forControlEvents:UIControlEventAllEvents];
    }
    return self;
    
}
- (IBAction)deleteBtnClicked:(id)sender {
}

- (void)phoneNumTextFieldAction:(UITextField *)textField{
    if ([self.delegate respondsToSelector:@selector(phoneNumView:textField:)]) {
        [self.delegate phoneNumView:self textField:textField];
    }
}   

@end

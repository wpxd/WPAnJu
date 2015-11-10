//
//  AJCustomerLeveal.h
//  AnJuOrganization
//
//  Created by 张旭东 on 15/11/10.
//  Copyright © 2015年 王鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AJCustomerLevealView;
@protocol AJCustomerLevealViewDelegate <NSObject>
- (void)LevealView:(void)levealView levealDidCheanged:(NSUInteger)leveal;
@end

@interface AJCustomerLevealView : UIView
@property (nonatomic ,copy)     NSArray *levealTitleArr;
@property (nonatomic ,assign,readonly)   NSUInteger leveal;
- (void)setLeveal:(NSUInteger)leveal animated:(BOOL)animated;
@end

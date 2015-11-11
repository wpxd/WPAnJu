//
//  AJRecommendHistoryFlagView.h
//  AnJuOrganization
//
//  Created by 张旭东 on 15/11/11.
//  Copyright © 2015年 王鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AJRecommendHistoryFlagView;

@protocol AJRecommendHistoryFlagViewDelegate <NSObject>
@optional
- (void)flagView:(AJRecommendHistoryFlagView *)flageView selcetedIndex:(NSUInteger)index;
@end

@interface AJRecommendHistoryFlagView : UIView
@property (weak ,nonatomic)id<AJRecommendHistoryFlagViewDelegate> delegate;
- (void)setCustomTitles:(NSArray *)titles;
- (void)selected:(NSUInteger)index;
@end

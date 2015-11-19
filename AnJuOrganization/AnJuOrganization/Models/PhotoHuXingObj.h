//
//  PhotoHuXingObj.h
//  AnJuChina
//
//  Created by apple on 14-3-28.
//  Copyright (c) 2014年 PengApple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhotoHuXingObj : NSObject
@property(nonatomic,strong)NSString *huxing_id;
@property(nonatomic,strong)NSString *house_id;
@property(nonatomic,strong)NSString *huxing_img;
@property(nonatomic,strong)NSString *huxing_title;
@property(nonatomic,strong)NSString *img_prefix;

- (id)initWithDictionary:(NSDictionary *)dict;
@end

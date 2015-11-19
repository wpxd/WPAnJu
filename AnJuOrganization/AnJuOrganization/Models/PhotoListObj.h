//
//  PhotoListObj.h
//  AnJuChina
//
//  Created by apple on 14-3-28.
//  Copyright (c) 2014年 PengApple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhotoListObj : NSObject
@property(nonatomic,strong)NSString *photo_id;
@property(nonatomic,strong)NSString *house_id;
@property(nonatomic,strong)NSString *photo_img;
@property(nonatomic,strong)NSString *photo_title;
@property(nonatomic,strong)NSString *photo_id_name;
@property(nonatomic,strong)NSString *xiangce_id;
@property(nonatomic,strong)NSString *img_prefix;

- (id)initWithDictionary:(NSDictionary *)dict;

@end

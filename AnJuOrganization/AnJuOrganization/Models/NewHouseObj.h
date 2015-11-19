//
//  NewHouseObj.h
//  AnJuChina
//
//  Created by apple on 14-3-25.
//  Copyright (c) 2014年 PengApple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewHouseObj : NSObject
@property(nonatomic,strong)NSString *region_id_name;
@property(nonatomic,strong)NSString *city_id;
@property(nonatomic,strong)NSString *house_img;
@property(nonatomic,strong)NSString *house_logo;
@property(nonatomic,strong)NSString *house_name;
@property(nonatomic,strong)NSString *map_lat;
@property(nonatomic,strong)NSString *map_lng;
@property(nonatomic,strong)NSString *price;
@property(nonatomic,strong)NSString *xiangmu_address;
@property(nonatomic,strong)NSString *yongjing;
@property(nonatomic,strong)NSString *house_id;
@property(nonatomic,strong)NSString *opening_time;
@property(nonatomic,strong)NSString *ruzhu_time;
@property(nonatomic,strong)NSString *xiangmu_miaoshu;
@property(nonatomic,strong)NSString *xiangmu_peitao;
@property(nonatomic,strong)NSString *jiaotong_conditions;
@property(nonatomic,strong)NSString *floor_condition;
@property(nonatomic,strong)NSString *parking_info;
@property(nonatomic,strong)NSString *related_info;
@property(nonatomic,strong)NSMutableArray *photo_list;
@property(nonatomic,strong)NSMutableArray *photo_huxingtu;
@property(nonatomic,strong)NSString *type_id_name;
@property(nonatomic,strong)NSString *record_title;
@property(nonatomic,strong)NSString *num_yuding;
@property(nonatomic,strong)NSString *num_tuijian;
@property(nonatomic,strong)NSString *map_url;
@property(nonatomic,strong)NSString *wap_url;
@property(nonatomic,strong)NSString *jiancai_zhuangxiu;
@property(nonatomic,strong)NSString *last_record_time;
@property(nonatomic,strong)NSString *hr_ifhot;
@property(nonatomic,strong)NSString *hr_ifnew;
@property(nonatomic,strong)NSString *start_time;
@property(nonatomic,strong)NSString *end_time;
@property(nonatomic,strong)NSString *ifhot;
@property(nonatomic,strong)NSString *ifnew;
- (id)initWithDictionary:(NSDictionary *)dict;
@end

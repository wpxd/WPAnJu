//
//  NewHouseObj.m
//  AnJuChina
//
//  Created by apple on 14-3-25.
//  Copyright (c) 2014年 PengApple. All rights reserved.
//

#import "NewHouseObj.h"
#import "PhotoListObj.h"
#import "PhotoHuXingObj.h"
@implementation NewHouseObj
- (id)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init])
    {
        self.photo_huxingtu = [[NSMutableArray alloc] initWithCapacity:0];
        self.photo_list = [[NSMutableArray alloc] initWithCapacity:0];
        self.region_id_name = [dict objectForKey:@"region_id_name"];
        self.city_id = [dict objectForKey:@"city_id"];
        self.house_img = [dict objectForKey:@"house_img"];
        self.house_logo = [dict objectForKey:@"house_logo"];
        self.house_name = [dict objectForKey:@"house_name"];
        self.map_lat = [dict objectForKey:@"map_lat"];
        self.map_lng = [dict objectForKey:@"map_lng"];
        self.price = [dict objectForKey:@"price"];
        self.xiangmu_address = [dict objectForKey:@"xiangmu_address"];
        self.yongjing = [dict objectForKey:@"yongjing"];
        self.house_id = [dict objectForKey:@"house_id"];
        self.opening_time = [dict objectForKey:@"opening_time"];
        self.ruzhu_time = [dict objectForKey:@"ruzhu_time"];
        self.xiangmu_miaoshu = [dict objectForKey:@"xiangmu_miaoshu"];
        self.xiangmu_peitao = [dict objectForKey:@"xiangmu_peitao"];
        self.jiaotong_conditions = [dict objectForKey:@"jiaotong_conditions"];
        self.floor_condition = [dict objectForKey:@"floor_condition"];
        self.parking_info = [dict objectForKey:@"parking_info"];
        self.related_info = [dict objectForKey:@"related_info"];
        self.type_id_name = [dict objectForKey:@"type_id_name"];
        self.record_title = [dict objectForKey:@"record_title"];
        self.num_yuding = [dict objectForKey:@"num_yuding"];
        self.num_tuijian = [dict objectForKey:@"num_tuijian"];
        self.map_url = [dict objectForKey:@"map_url"];
        self.wap_url = [dict objectForKey:@"wap_url"];
        self.jiancai_zhuangxiu = [dict objectForKey:@"jiancai_zhuangxiu"];
        self.last_record_time = [dict objectForKey:@"last_record_time"];
        self.hr_ifnew = [dict objectForKey:@"hr_ifnew"];
        self.hr_ifhot = [dict objectForKey:@"hr_ifhot"];
        self.start_time = [dict objectForKey:@"start_time"];
        self.end_time = [dict objectForKey:@"end_time"];
        self.ifhot = [dict objectForKey:@"ifhot"];
        self.ifnew = [dict objectForKey:@"ifnew"];
        for (NSDictionary *potoListDic in [dict objectForKey:@"photo_list"])
        {
            PhotoListObj *photoListObj = [[PhotoListObj alloc] initWithDictionary:potoListDic];
            [self.photo_list addObject:photoListObj];
        }
        for (NSDictionary *photoHuXingDic in [dict objectForKey:@"photo_huxingtu"])
        {
            PhotoHuXingObj *photoHuXingObj = [[PhotoHuXingObj alloc] initWithDictionary:photoHuXingDic];
            [self.photo_huxingtu addObject:photoHuXingObj];
        }
    }
    return self;
}
@end

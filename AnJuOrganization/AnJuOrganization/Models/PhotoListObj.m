//
//  PhotoListObj.m
//  AnJuChina
//
//  Created by apple on 14-3-28.
//  Copyright (c) 2014年 PengApple. All rights reserved.
//

#import "PhotoListObj.h"

@implementation PhotoListObj
- (id)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init])
    {
        self.photo_id = [dict objectForKey:@"photo_id"];
        self.house_id = [dict objectForKey:@"house_id"];
        self.xiangce_id = [dict objectForKey:@"xiangce_id"];
        self.photo_img = [dict objectForKey:@"photo_img"];
        self.photo_title = [dict objectForKey:@"photo_title"];
        self.photo_id_name = [dict objectForKey:@"photo_id_name"];
        self.img_prefix = [dict objectForKey:@"img_prefix"];
    }
    return self;
}
@end

//
//  PhotoHuXingObj.m
//  AnJuChina
//
//  Created by apple on 14-3-28.
//  Copyright (c) 2014年 PengApple. All rights reserved.
//

#import "PhotoHuXingObj.h"

@implementation PhotoHuXingObj
- (id)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init])
    {
        self.huxing_id = [dict objectForKey:@"huxing_id"];
        self.house_id = [dict objectForKey:@"house_id"];
        self.huxing_img = [dict objectForKey:@"huxing_img"];
        self.huxing_title = [dict objectForKey:@"huxing_title"];
        self.img_prefix = [dict objectForKey:@"img_prefix"];
    }
    return self;
}
@end

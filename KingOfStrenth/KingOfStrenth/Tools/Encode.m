//
//  Encode.m
//  yun
//
//  Created by gurenxing on 16/7/1.
//  Copyright © 2016年 me.zhangxi. All rights reserved.
//

#import "Encode.h"

@implementation Encode
+ (NSString *)UrlEncodedString:(NSString *)str
{
    NSString *result = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,(CFStringRef)str ,NULL ,CFSTR("!*'();:@&=+$,/?%#[]") ,kCFStringEncodingUTF8));
    return result;
}
@end

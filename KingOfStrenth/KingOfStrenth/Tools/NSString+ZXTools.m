#import "NSString+ZXTools.h"

@implementation NSString (ZXTools)
- (BOOL)isMobileNumber
{

    
//    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9]|7[0])\\d{8}$";
    NSString * MOBILE = @"^1[34578]\\d{9}$";

    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
     
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";

    NSString * CT = @"^1((83|47|33|53|8[09])[0-9]|349)\\d{7}$";
           
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:self] == YES)
        || ([regextestcm evaluateWithObject:self] == YES)
        || ([regextestct evaluateWithObject:self] == YES)
        || ([regextestcu evaluateWithObject:self] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

-(BOOL)isEmailAddress
{
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:self];
    
}
-(BOOL)containChineseWord
{
    NSString    *text = self;
    NSUInteger length = [text length];
    
    for (int i=0; i<length; ++i)
    {
        NSRange range = NSMakeRange(i, 1);
        NSString *subString = [text substringWithRange:range];
        const char    *cString = [subString UTF8String];
        if(cString == nil)
        {
            return YES;
        }
        if (strlen(cString) == 3)
        {
            return YES;
        }
    }
    return NO;
}
-(BOOL)isDateNumber{
    NSString *dateRegex = @"^(?:(?!0000)[0-9]{4}([-/.]?)(?:(?:0?[1-9]|1[0-2])([-/.]?)(?:0?[1-9]|1[0-9]|2[0-8])|(?:0?[13-9]|1[0-2])([-/.]?)(?:29|30)|(?:0?[13578]|1[02])([-/.]?)31)|(?:[0-9]{2}(?:0[48]|[2468][048]|[13579][26])|(?:0[48]|[2468][048]|[13579][26])00)([-/.]?)0?2([-/.]?)29)$";
    
    NSPredicate *dateTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", dateRegex];
    
    return [dateTest evaluateWithObject:self];
}
-(BOOL)isCharacter{
    NSString    *text = self;
    NSUInteger length = [text length];
    for (int i=0; i<length; ++i)
    {
        NSRange range = NSMakeRange(i, 1);
        NSString *subString = [text substringWithRange:range];
        const char    *cString = [subString UTF8String];
        if(cString == nil)
        {
            return YES;
        }
        if (strlen(cString) == 4)
        {
            return YES;
        }
    }
    return NO;
}
// 2016.3.9 判断是否是有效字符
-(BOOL)containValidCharacter
{
    //    [a-zA-Z\u4e00-\u9fa5][a-zA-Z0-9\u4e00-\u9fa5]+
    // 2016.3.14 修改判断是否为有效字符的正则表达式
    // 忘记提备注
    NSString *regex = @"^[A-Za-z0-9\u4E00-\u9FA5]+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:self];
}
// 2016.3.9 判断字符串是否是字母
-(BOOL)containEnglishWord
{
    NSString * regex = @"^[A-Za-z]";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:self];
}
// 2016.3.10 判断是否含有数字字符串
-(BOOL)containNumber
{
    NSString *regex = @"^(?=.*[0-9]).*$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [pred evaluateWithObject:self];
}
//2016.3.25 只含有数字、字母、下划线不能以下划线开头
-(BOOL)isHeaderUnderlineNumChar
{
    NSString *regex = @"^(?!_)[a-zA-Z0-9_]+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:self];
}
// 2016.03.25 含有数字或者字母
-(BOOL)containNumAndCharacter
{
    NSString *regex = @"^[A-Za-z0-9]+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:self];
}
//2016.3.25 字符串只含有字母
-(BOOL)isChar
{
    NSString *regex = @"^[A-Za-z]+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:self];
}
//2016.3.25字符串只含有数字
-(BOOL)isNumber
{
    NSString *regex = @"^[0-9]+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:self];
}

//2016.3.25 只包含数字和下划线
-(BOOL)containNumAnd_
{
    NSString *regex = @"^[0-9_]+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:self];
}
//2016.3.25 只包含字母和下划线
-(BOOL)containCharAnd_
{
    NSString *regex = @"^[a-zA-Z_]+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:self];
}

@end

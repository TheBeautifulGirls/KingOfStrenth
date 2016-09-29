#import "NSString+ZXMD5.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (ZXMD5)

-(NSString*)fileMD5
{
    NSFileHandle *handle = [NSFileHandle fileHandleForReadingAtPath:self];
    if( handle== nil ) return @"ERROR GETTING FILE MD5"; // file didnt exist
    
    CC_MD5_CTX md5;
    
    CC_MD5_Init(&md5);
    
    BOOL done = NO;
    while(!done)
    {
        NSData* fileData = [handle readDataOfLength: 1024*100];
        CC_MD5_Update(&md5, [fileData bytes], [fileData length]);
        if( [fileData length] == 0 ) done = YES;
    }
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5_Final(digest, &md5);
    NSString* s = [NSString stringWithFormat: @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                   digest[0], digest[1],
                   digest[2], digest[3],
                   digest[4], digest[5],
                   digest[6], digest[7],
                   digest[8], digest[9],
                   digest[10], digest[11],
                   digest[12], digest[13],
                   digest[14], digest[15]];
    return s;
}

-(NSString *)stringMD5
{
	if (self == nil) {
		return nil;
	}
	const char *cstr = [self UTF8String];
	unsigned char result[CC_MD5_DIGEST_LENGTH];
	CC_MD5(cstr, strlen(cstr), result);
	
	return [NSString stringWithFormat: @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
			result[0], result[1],
			result[2], result[3],
			result[4], result[5],
			result[6], result[7],
			result[8], result[9],
			result[10], result[11],
			result[12], result[13],
			result[14], result[15]];
}
-(NSString *)removeLastCharacter
{
    if(self.length > 1)
    {
        return [self substringToIndex:self.length -1];
    }else
    {
        return self;
    }
}
@end

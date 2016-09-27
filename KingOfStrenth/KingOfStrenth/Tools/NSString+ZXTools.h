#import <Foundation/Foundation.h>

@interface NSString (ZXTools)

//判断是否是电话号码
- (BOOL)isMobileNumber;
-(BOOL)isEmailAddress;
-(BOOL)containChineseWord;
-(BOOL)isCharacter;
-(BOOL)isDateNumber;
-(BOOL)containEnglishWord;
-(BOOL)containValidCharacter;
-(BOOL)containNumber;
-(BOOL)containNumAndChaAndUnderline;
-(BOOL)containNumAndCharacter;
-(BOOL)isHeaderUnderlineNumChar;
-(BOOL)containNumAnd_;
-(BOOL)containCharAnd_;
-(BOOL)isNumber;
-(BOOL)isChar;
@end

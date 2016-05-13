//
//  RJFunctions.m
//  yupen
//
//  Created by 辉贾 on 16/3/11.
//  Copyright © 2016年 RJ. All rights reserved.
//

#import "RJFunctions.h"
#import <CommonCrypto/CommonCryptor.h>

@implementation RJFunctions

#pragma mark - JSON
void AddObjectForKeyIntoDictionary(id object, id key, NSMutableDictionary *dic)
{
    if (object == nil || key == nil || dic == nil
        || ![dic isKindOfClass:[NSDictionary class]]
        || ([object isKindOfClass:[NSString class]] && [object isEqualToString:@""]))
        return;
    
    [dic setObject:object forKey:key];
}

id ObjForKeyInUnserializedJSONDic(NSDictionary *unserializedJSONDic, id key)
{
    if (unserializedJSONDic == nil || key == nil || ![unserializedJSONDic isKindOfClass:[NSDictionary class]])
        return nil;
    
    id obj = [unserializedJSONDic objectForKey:key];
    if (obj == [NSNull null])
        return nil;
    else if ([obj isKindOfClass:[NSString class]] && [obj isEqualToString:@""])
        return nil;
    else
        return obj;
}
NSString* StringForKeyInUnserializedJSONDic(NSDictionary *unserializedJSONDic, id key)
{
    id obj = ObjForKeyInUnserializedJSONDic(unserializedJSONDic,key);
    if (obj == nil) {
        return  @"";
    }
    if ([obj isKindOfClass:[NSString class]]) {
        return obj;
    }
    return  [NSString stringWithFormat:@"%@",obj];
}
CGFloat FloatForKeyInUnserializedJSONDic(NSDictionary *unserializedJSONDic, id key)
{
    id obj = ObjForKeyInUnserializedJSONDic(unserializedJSONDic,key);
    if (obj == nil) {
        return  0.0;
    }
    if ([obj isKindOfClass:[NSNumber class]]) {
        return [obj floatValue];
    }
    if ([obj isKindOfClass:[NSString class]]) {
        return [obj floatValue];
    }
    return  0.0;
}
double DoubleForKeyInUnserializedJSONDic(NSDictionary *unserializedJSONDic, id key)
{
    id obj = ObjForKeyInUnserializedJSONDic(unserializedJSONDic,key);
    if (obj == nil) {
        return  0.0;
    }
    if ([obj isKindOfClass:[NSNumber class]]) {
        return [obj doubleValue];
    }
    if ([obj isKindOfClass:[NSString class]]) {
        return [obj doubleValue];
    }
    return  0.0;
}
NSInteger IntForKeyInUnserializedJSONDic(NSDictionary *unserializedJSONDic, id key)
{
    id obj = ObjForKeyInUnserializedJSONDic(unserializedJSONDic,key);
    if (obj == nil) {
        return  0;
    }
    if ([obj isKindOfClass:[NSNumber class]]) {
        return [obj intValue];
    }
    if ([obj isKindOfClass:[NSString class]]) {
        return [obj intValue];
    }
    return  0;
}
UInt64 BigIntForKeyInUnserializedJSONDic(NSDictionary *unserializedJSONDic, id key)
{
    id obj = ObjForKeyInUnserializedJSONDic(unserializedJSONDic,key);
    if (obj == nil) {
        return  0;
    }
    if ([obj isKindOfClass:[NSNumber class]]) {
        return [obj unsignedLongLongValue];
    }
    if ([obj isKindOfClass:[NSString class]]) {
        return [obj unsignedLongLongValue];
    }
    return  0;
}
Boolean BoolForKeyInUnserializedJSONDic(NSDictionary *unserializedJSONDic, id key)
{
    id obj = ObjForKeyInUnserializedJSONDic(unserializedJSONDic,key);
    if (obj == nil) {
        return  NO;
    }
    if ([obj isKindOfClass:[NSNumber class]]) {
        return [obj boolValue];
    }
    if ([obj isKindOfClass:[NSString class]]) {
        return [obj boolValue];
    }
    return  NO;
}

#pragma mark -判断是否为空
Boolean IsStringEmptyOrNull(NSString * str)
{
    if (!str) {
        // null object
        return true;
    } else {
        NSString *trimedString = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if ([trimedString length] == 0) {
            // empty string
            return true;
        } else if([trimedString isEqualToString:@"null"]){
            // is neither empty nor null
            return true;
        }
        else if([trimedString isEqualToString:@"(null)"]){
            // is neither empty nor null
            return true;
        }else {
            return false;
        }
    }
}
Boolean IsNormalMobileNum(NSString  *userMobileNum){
    if ([userMobileNum length] != 11) {
        return NO;
    }
    NSString *patternStr = [NSString stringWithFormat:@"^(0?1[3578]\\d{9})$|^((0(10|2[1-3]|[3-9]\\d{2}))?[1-9]\\d{6,7})$"];
    NSRegularExpression *regularexpression=[[NSRegularExpression alloc]initWithPattern:patternStr
                                                                               options:NSRegularExpressionCaseInsensitive
                                                                                 error:nil];
    NSUInteger numberOfMatch = [regularexpression numberOfMatchesInString:userMobileNum
                                                                  options:NSMatchingReportProgress
                                                                    range:NSMakeRange(0, userMobileNum.length)];
    if (numberOfMatch > 0) {
        return YES;
    }
    return NO;
    
}

#pragma mark -MBProgressHUD
void ShowImportErrorAlertView(NSString *errorMsg){
    [[[UIAlertView alloc]initWithTitle:@""
                               message:errorMsg
                              delegate:nil
                     cancelButtonTitle:nil
                     otherButtonTitles:@"确定", nil] show];
}

void ShowImportErrorAlertView2(NSString *errorTitle,NSString *errorMsg){
    
    [[[UIAlertView alloc]initWithTitle:errorTitle
                               message:errorMsg
                              delegate:nil
                     cancelButtonTitle:nil
                     otherButtonTitles:@"确定", nil] show];
    
}

/*
MBProgressHUD* CreateCustomColorHUDOnView(UIView *onView)
{
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:onView];
    hud.color = [UIColor greenColor];
    //hud.labelColor = kColorTextColorDarkClay;
    return hud;
}
void SuccessMBProgressHUD(UIView *onView, NSString *labelText)
{
    MBProgressHUD *hud = [MBProgressHUD HUDForView:onView];
    if (hud == nil) {
        return;
    }
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"black_tips_ok.png"]];
    hud.removeFromSuperViewOnHide = YES;
    hud.labelText = labelText;
    hud.completionBlock = nil;
    [onView addSubview:hud];
    [onView bringSubviewToFront:hud];
    [hud hide:YES afterDelay:2.0];
}
void FailedMBProgressHUD(UIView *onView, NSString *labelText)
{
    MBProgressHUD *hud = [MBProgressHUD HUDForView:onView];
    if (hud == nil) {
        return;
    }
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"black_tips_error.png"]];
    hud.removeFromSuperViewOnHide = YES;
    hud.labelText = labelText;
    hud.completionBlock = nil;
    [onView addSubview:hud];
    [onView bringSubviewToFront:hud];
    [hud hide:YES afterDelay:2.0];
}
void WaittingMBProgressHUD(UIView *onView, NSString *labelText)
{
    MBProgressHUD *hud = [MBProgressHUD HUDForView:onView];
    if (hud == nil) {
        hud = CreateCustomColorHUDOnView(onView);
    }
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.removeFromSuperViewOnHide = YES;
    hud.labelText = labelText;
    hud.completionBlock = nil;
    [onView addSubview:hud];
    [hud show:YES];
}
void FinishMBProgressHUD(UIView *onView)
{
    MBProgressHUD *hud = [MBProgressHUD HUDForView:onView];
    if (hud == nil) {
        return;
    }
    [hud hide:YES];
}

NSDictionary* encryptUseDES(NSDictionary *dict)
{
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
    NSString * string = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    NSString *ciphertext = nil;
    const char *textBytes = [string UTF8String];
    //    NSUInteger dataLength = [plainText length];
    //   NSUInteger dataLength = [plainText lenghtWithString2:plainText];
    
    int strlength = 0;
    char* p = (char*)[string cStringUsingEncoding:NSUnicodeStringEncoding];
    for (int i=0 ; i<[string lengthOfBytesUsingEncoding:NSUnicodeStringEncoding] ;i++) {
        if (*p) {
            p++;
            strlength++;
        }
        else {
            p++;
        }
    }
    
    NSUInteger dataLength = (strlength-string.length)*2 + string.length;
    unsigned char buffer[1024];
    memset(buffer, 0, sizeof(char));
    
    Byte iv[] = {0x12, 0x34, 0x56, 0x78, 0x90, 0xAB, 0xCD, 0xEF };
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding,
                                          [@"a!s@d#f$" UTF8String], kCCKeySizeDES,
                                          iv,
                                          textBytes, dataLength,
                                          buffer, 1024,
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        NSData *data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesEncrypted];
        
        ciphertext = [[NSString alloc] initWithData:[GTMBase64 encodeData:data] encoding:NSUTF8StringEncoding];
    }
    return [NSDictionary dictionaryWithObjectsAndKeys:ciphertext,@"DesEncToDes", nil];
}
*/
#pragma mark -Image TOOL
UIImage* createImageWithColor(UIColor *color)
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

UIColor* colorAddAlpha(UIColor* color,CGFloat alpha)
{
    if (CGColorGetNumberOfComponents([color CGColor]) == 2) {
        const CGFloat *colorComponents = CGColorGetComponents([color CGColor]);
        return [UIColor colorWithRed:colorComponents[0]
                               green:colorComponents[0]
                                blue:colorComponents[0]
                               alpha:alpha];
    }
    else if (CGColorGetNumberOfComponents([color CGColor]) == 4) {
        const CGFloat * colorComponents = CGColorGetComponents([color CGColor]);
        return [UIColor colorWithRed:colorComponents[0]
                               green:colorComponents[1]
                                blue:colorComponents[2]
                               alpha:alpha];
    }
    return color;
}
@end

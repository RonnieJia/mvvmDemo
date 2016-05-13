//
//  RJFunctions.h
//  yupen
//
//  Created by 辉贾 on 16/3/11.
//  Copyright © 2016年 RJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface RJFunctions : NSObject
#pragma mark - JSON
//将键-值对加入字典。会剔除object或key或dic为nil的情况
extern void AddObjectForKeyIntoDictionary(id object, id key, NSMutableDictionary *dic);

//从反JSON序列化后的字典里面读取Key对应的对象。 如果对象为NSString对象并且是@"", 会返回nil
extern id ObjForKeyInUnserializedJSONDic(NSDictionary *unserializedJSONDic, id key);

//从反JSON序列化后的字典里面读取Key对应的String,不是String的数据则进行转换
extern NSString* StringForKeyInUnserializedJSONDic(NSDictionary *unserializedJSONDic, id key);

//从反JSON序列化后的字典里面读取Key对应的CGFloat,不是CGFloat的数据则进行转换
extern CGFloat FloatForKeyInUnserializedJSONDic(NSDictionary *unserializedJSONDic, id key);

//从反JSON序列化后的字典里面读取Key对应的double,不是double的数据则进行转换
extern double DoubleForKeyInUnserializedJSONDic(NSDictionary *unserializedJSONDic, id key);

//从反JSON序列化后的字典里面读取Key对应的NSInteger,不是NSInteger的数据则进行转换
extern NSInteger IntForKeyInUnserializedJSONDic(NSDictionary *unserializedJSONDic, id key);

//从反JSON序列化后的字典里面读取Key对应的Boolean,不是Boolean的数据则进行转换
extern Boolean BoolForKeyInUnserializedJSONDic(NSDictionary *unserializedJSONDic, id key);

//从反JSON序列化后的字典里面读取Key对应的Uint64 ,不是Uint64的数据则进行转换
extern UInt64 BigIntForKeyInUnserializedJSONDic(NSDictionary *unserializedJSONDic, id key);

#pragma mark -判断是否为空
extern Boolean IsStringEmptyOrNull(NSString * str);

#pragma mark -是否为手机号
extern Boolean IsNormalMobileNum(NSString  *userMobileNum);

#pragma mark -时间函数
extern NSString *timeShortDesc(double localAddTime);

#pragma mark - 错误提示
extern void ShowImportErrorAlertView(NSString *errorMsg);
extern void ShowImportErrorAlertView2(NSString *errorTitle,NSString *errorMsg);

#pragma mark -MBProgressHUD(模态提示框)
extern void SuccessMBProgressHUD(UIView *onView, NSString *labelText);
extern void FailedMBProgressHUD(UIView *onView, NSString *labelText);
extern void WaittingMBProgressHUD(UIView *onView, NSString *labelText);
extern void FinishMBProgressHUD(UIView *onView);

#pragma mark -Image TOOL
extern UIImage* createImageWithColor(UIColor *color);
extern UIColor* colorAddAlpha(UIColor* color,CGFloat alpha);

#pragma mark -NSString DES
extern NSDictionary* encryptUseDES(NSDictionary *dict);
@end

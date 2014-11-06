//
//  HANPasswordManager.h
//  passwordSystem
//
//  Created by Han Pengbo on 14-2-11.
//  Copyright (c) 2014年 Han Pengbo.
//  Distributed under MIT License
//  Get the latest version of HANPasswordManager from here:
//  https://github.com/nimingzhe/HANPasswordManager
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define isSettingPassword 1
#define isChangingPassword 2
#define isInputingPassword 3
#define isInputtingAgain 4
#define isSettingUpAgain 5


@protocol HANPassswordManagerDelegate <NSObject>

- (void)rightPasswordDidInput;

@optional
- (void)passwordDidSetUp;
- (void)passwordDidChanged;

- (void)cancelSettingUpPassword;
- (void)cancelInputtingPassword;

@end

@interface HANPasswordManager : NSObject <UITextFieldDelegate>
{
    NSString *tempPassword;
    UIAlertView *firstAlertView,*secondAlertView,*originalAlertView,*changingAlertView;
    UITextField *firstTextField,*secondTextField,*originalTextField,*changingTextField;
}

@property id<HANPassswordManagerDelegate> delegate;
@property NSString *password;
@property BOOL mustInputPassword;



- (void)inputAndCheckPassword;
- (void)setUpPassword;
- (NSString*)getPaaword;
- (void)changePassword;

@end

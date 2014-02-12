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

#define isSettingPassword 1
#define isChangingPassword 2
#define isInputingPassword 3


@protocol HANPassswordManagerDelegate <NSObject>

- (void)rightPasswordDidInput;

@optional
- (void)passwordDidSetUp;

@end

@interface HANPasswordManager : NSObject <UITextFieldDelegate>
{
    NSString *password,*tempPassword;
    UIAlertView *firstAlertView,*secondAlertView,*originalAlertView,*changingAlertView;
    UITextField *firstTextField,*secondTextField,*originalTextField,*changingTextField;
    BOOL isPasswordSetted;
    
    
}

@property id<HANPassswordManagerDelegate> delegate;

- (void)inputAndCheckPassword;
- (void)setUpPassword;
- (NSString*)getPaaword;
- (void)changePassword;
- (BOOL)isPasswordSetted;
@end

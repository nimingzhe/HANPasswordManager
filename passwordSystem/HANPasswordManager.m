//
//  HANPasswordManager.m
//  passwordSystem
//
//  Created by Han Pengbo on 14-2-11.
//  Copyright (c) 2014年 Han Pengbo.
//  Distributed under MIT License
//  Get the latest version of HANPasswordManager from here:
//  https://github.com/nimingzhe/HANPasswordManager
//

#import "HANPasswordManager.h"

@implementation HANPasswordManager
- (id)init
{
    self=[super init];
    if (self!=nil) {
        firstAlertView.delegate=self;
        secondAlertView.delegate=self;
    }
    return self;
}

- (void)setUpPassword
{
    
    firstAlertView= [[UIAlertView alloc] initWithTitle:@"设置密码" message:@"请输入您要设置的密码" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定",nil];
    firstAlertView.alertViewStyle = UIAlertViewStyleSecureTextInput;
    firstAlertView.tag=isSettingPassword;
    [firstAlertView show];
    firstTextField=[firstAlertView textFieldAtIndex:0];
    firstTextField.delegate=self;
}

- (NSString*)getPaaword
{
    return self.password;
}



- (void)inputAndCheckPassword;
{
    if (self.isPasswordSetted==YES) {
        originalAlertView=[[UIAlertView alloc] initWithTitle:@"请输入您的密码" message:@"" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定",nil];
        originalAlertView.alertViewStyle = UIAlertViewStyleSecureTextInput;
        originalAlertView.tag=isInputingPassword;
        [originalAlertView show];
        originalTextField=[originalAlertView textFieldAtIndex:0];
        originalTextField.delegate=self;
    } else {
        [self setUpPassword];
    }
    
}

- (void)changePassword;
{
    if (self.isPasswordSetted==YES) {
        originalAlertView=[[UIAlertView alloc] initWithTitle:@"请输入您的旧密码" message:@"" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定",nil];
        originalAlertView.alertViewStyle = UIAlertViewStyleSecureTextInput;
        originalAlertView.tag=isChangingPassword;
        [originalAlertView show];
        originalTextField=[originalAlertView textFieldAtIndex:0];
        originalTextField.delegate=self;
        
    } else {
        [self setUpPassword];
    }
}

#pragma mark -
#pragma mark UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    
    if (alertView.tag==isChangingPassword&&buttonIndex==1) {
        if (alertView==originalAlertView) {
            if ([originalTextField.text isEqualToString:self.password]) {
                firstAlertView= [[UIAlertView alloc] initWithTitle:@"修改密码" message:@"请输入您要设置的新密码" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定",nil];
                firstAlertView.alertViewStyle = UIAlertViewStyleSecureTextInput;
                firstAlertView.tag=isChangingPassword;
                [firstAlertView show];
                firstTextField=[firstAlertView textFieldAtIndex:0];
                firstTextField.delegate=self;
            }
            else
            {
                UIAlertView *temp=[[UIAlertView alloc] initWithTitle:@"密码错误" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
                [temp show];
            }
        }
        if (alertView==firstAlertView) {
            tempPassword=firstTextField.text;
            secondAlertView=[[UIAlertView alloc] initWithTitle:@"修改密码" message:@"请再次输入您要设置的新密码" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定",nil];
            secondAlertView.alertViewStyle = UIAlertViewStyleSecureTextInput;
            secondAlertView.tag=isChangingPassword;
            secondTextField=[secondAlertView textFieldAtIndex:0];
            secondTextField.delegate=self;
            [secondAlertView show];
        }
        if (alertView==secondAlertView) {
            if ([tempPassword isEqualToString:secondTextField.text]) {
                self.password=tempPassword;
                self.isPasswordSetted=YES;
                UIAlertView *temp=[[UIAlertView alloc] initWithTitle:@"密码修改成功" message:@"" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
                [temp show];
                [self.delegate passwordDidChanged];
            }
            else
            {
                UIAlertView *temp=[[UIAlertView alloc] initWithTitle:@"密码修改失败" message:@"两次输入的密码不一致" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
                [temp show];
            }
        }
    }
    if (alertView.tag==isInputingPassword&&buttonIndex==1) {
        if ([originalTextField.text isEqualToString:self.password]) {
            [self.delegate rightPasswordDidInput];
        }
        else
        {
            UIAlertView *temp=[[UIAlertView alloc] initWithTitle:@"密码错误" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [temp show];
        }
    }
    if (alertView.tag==isSettingPassword&&buttonIndex==1) {
        if (alertView==firstAlertView) {
            tempPassword=firstTextField.text;
            secondAlertView=[[UIAlertView alloc] initWithTitle:@"设置密码" message:@"请再次输入您要设置的密码" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定",nil];
            secondAlertView.alertViewStyle = UIAlertViewStyleSecureTextInput;
            secondAlertView.tag=isSettingPassword;
            secondTextField=[secondAlertView textFieldAtIndex:0];
            secondTextField.delegate=self;
            [secondAlertView show];
            
        }
        if (alertView==secondAlertView) {
            
            if ([tempPassword isEqualToString:secondTextField.text]) {
                self.password=tempPassword;
                self.isPasswordSetted=YES;
                UIAlertView *temp=[[UIAlertView alloc] initWithTitle:@"密码设置成功" message:@"" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
                [temp show];
                [_delegate passwordDidSetUp];
            }
            else
            {
                UIAlertView *temp=[[UIAlertView alloc] initWithTitle:@"密码设置失败" message:@"两次输入的密码不一致" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
                [temp show];
            }
            
        }
    }
    
}


#pragma mark -
#pragma mark UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    if (textField==firstTextField) {
        [firstAlertView dismissWithClickedButtonIndex:1 animated:YES];
    }
    
    if (textField==secondTextField) {
        [secondAlertView dismissWithClickedButtonIndex:1 animated:YES];
    }
    if (textField==originalTextField) {
        [originalAlertView dismissWithClickedButtonIndex:1 animated:YES];
    }

    if (textField==changingTextField) {
        [changingAlertView dismissWithClickedButtonIndex:1 animated:YES];
    }

    return YES;
}

@end

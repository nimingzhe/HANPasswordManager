//
//  ViewController.h
//  passwordSystem
//
//  Created by Han Pengbo on 14-2-11.
//  Copyright (c) 2014年 Han Pengbo.
//  Distributed under MIT License
//  Get the latest version of HANPasswordManager from here:
//  https://github.com/nimingzhe/HANPasswordManager
//


#import <UIKit/UIKit.h>
#import "HANPasswordManager.h"

@interface ViewController : UIViewController <HANPassswordManagerDelegate>
{
    HANPasswordManager *manager;
}

- (IBAction)setPassword:(id)sender;
- (IBAction)inputPassword:(id)sender;
- (IBAction)changePassword:(id)sender;

@end

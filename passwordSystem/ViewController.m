//
//  ViewController.m
//  passwordSystem
//
//  Created by Han Pengbo on 14-2-11.
//  Copyright (c) 2014年 Han Pengbo.
//  Distributed under MIT License
//  Get the latest version of HANPasswordManager from here:
//  https://github.com/nimingzhe/HANPasswordManager
//
#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    manager=[[HANPasswordManager alloc] init];
    manager.delegate=self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)setPassword:(id)sender {
    [manager setUpPassword];
    
}

- (IBAction)inputPassword:(id)sender {
    [manager inputAndCheckPassword];
}

- (IBAction)changePassword:(id)sender {
    [manager changePassword];
}

- (IBAction)removePassword:(id)sender {
    [manager removePasswordFromPrefrence];
    //debug
    NSArray *keys = [[[[NSUserDefaults standardUserDefaults] dictionaryRepresentation] allKeys] copy];
    for(NSString *key in keys) {
        NSLog(@"Key Name: %@", key);
    }
}

#pragma mark -
#pragma mark HANPassswordManagerDelegate
- (void)rightPasswordDidInput
{
    NSLog(@"密码输入正确");
}

- (void)passwordDidSetUp
{
    NSLog(@"密码创建成功");
    //debug
    NSArray *keys = [[[[NSUserDefaults standardUserDefaults] dictionaryRepresentation] allKeys] copy];
    for(NSString *key in keys) {
        NSLog(@"Key Name: %@", key);
    }
}

- (void)passwordDidChanged;
{
    NSLog(@"密码修改成功");
}

- (void)PasswordDidCancelSettingUp
{
    NSLog(@"取消设置");
}




@end

#简介#
HANPasswordManager类封装了一个密码系统，提供了创建密码、输入并检查密码、修改密码的功能。只支持ARC。使用时只需将HANPasswordManager.h和HANPasswordManager.m文件拖入您的项目即可。

#Properties#
    @property id<HANPassswordManagerDelegate> delegate;
用于设置代理的对象，可对密码创建成功和密码输入正确后做出响应。

#方法#
    - (void)inputAndCheckPassword;

弹出一个UIAlertView，让用户输入密码，若密码正确，则执行代理方法

    - (void)setUpPassword;

创建密码

    - (NSString*)getPaaword;

返回用户已设置的密码，若密码未设置，则引导用户设置密码

    - (void)changePassword;

修改密码，，若密码未设置过，则引导用户设置密码

    - (BOOL)isPasswordSetted;

判断用户是否设置过密码

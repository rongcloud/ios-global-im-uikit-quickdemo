//
//  RCDLoginViewController.m
//  ios-global-im-uikit-quickdemo
//
//  Created by shuai shao on 2023/11/23.
//

#import <RongIMLibCore/RongIMLibCore.h>

#import "RCDLoginViewController.h"
#import "RCDChatListViewController.h"

@interface RCDLoginViewController ()

@property (nonatomic, weak) IBOutlet UITextField *keyTextField;
@property (nonatomic, weak) IBOutlet UITextField *tokenTextField;

@property (nonatomic, weak) IBOutlet UILabel *tipLabel;

@end

@implementation RCDLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tipLabel.text = @"步骤：\n1、输入 AppKey；\n2、点击初始化；\n3、输入 Token；\n4、点击连接；\n连接成功后自定跳转会话列表页面";
    
    /// 快捷方式
    self.keyTextField.text = @"";
    self.tokenTextField.text = @"";
}

- (IBAction)initIMSDK:(UIButton *)button {
    NSString *appKey = self.keyTextField.text;
    if (appKey.length == 0) {
        NSLog(@"appKey 不能为空");
        return;
    }
    [[RCCoreClient sharedCoreClient] initWithAppKey:appKey option:nil];
    [button setTitle:@"已初始化" forState:UIControlStateNormal];
    [button setEnabled:NO];
}

- (IBAction)connect:(UIButton *)button {
    NSString *token = self.tokenTextField.text;
    if (token.length == 0) {
        NSLog(@"token 不能为空");
        return;
    }
    [button setEnabled:NO];
    [button setTitle:@"连接中" forState:UIControlStateDisabled];
    [[RCCoreClient sharedCoreClient] connectWithToken:token
                                             dbOpened:^(RCDBErrorCode code) {}
                                              success:^(NSString * _Nonnull userId) {
        // 回调在异步线程，需要切换到主线程展示 UI
        dispatch_async(dispatch_get_main_queue(), ^{
            [self pushChatList];
            [button setEnabled:YES];
        });
    } error:^(RCConnectErrorCode errorCode) {
        NSLog(@"连接失败 %@", @(errorCode));
    }];
}

- (void)pushChatList {
    RCDChatListViewController *controller = [[RCDChatListViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

@end

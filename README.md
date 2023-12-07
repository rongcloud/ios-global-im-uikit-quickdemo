# 融云 GlobalIMUIKit 集成示例

本代码仓库提供 GlobalIMUIKit 在 iOS 端的示例代码，以便开发者体验产品。

<p align="center" style="background-color: #e1e5eb; padding: 10px; margin-top: 5px; margin-bottom:5px;">
<img src="images/rtcapp-demo.png" width="40%">
</p>

## 前提条件

* 推荐使用 Xcode 14 或以上版本，GlobalIMUIKit 支持最低版本为 9.0；
* 示例应用需要有 App Key 才能换取客户端连接融云服务器的身份凭证。请开通融云开发者账号，并在后台 [获取 App Key](https://developer.rongcloud.cn/app/appkey)。

## 运行示例应用

1. 克隆本存储库下载示例代码；
2. 直接打开目录中的 ios-global-im-uikit-quickdemo.xcodeproj 文件；
3. 运行项目，如果用真机运行，需要配置开发者账号；使用模拟器可以直接运行；
4. 运行后，在 App Key 输入栏输入 App Key 点击初始化；
5. 初始化成功后，在 Token 输入栏输入 Token，点击连接。
   开发者也可以直接在代码中设置 AppKey 和 Token：
   ```
   /// 快捷方式
    self.keyTextField.text = @"";
    self.tokenTextField.text = @"";
   ```

## 文档

- [海外 IMKit（GlobalIMUIKit）文档]

## 支持

源码地址 [Github](https://github.com/rongcloud/ios-global-im-uikit-quickdemo)，任何问题可以通过 Github Issues 提问。

Demo 源码遵循 MIT 开源协议。

<!-- Reference links below -->

<!-- links to docs -->

[海外 IMKit（GlobalIMUIKit）文档]: https://doc.rongcloud.cn/imuikit/IOS/1.X/prepare

<!-- links to ops -->

[获取 App Key]: https://developer.rongcloud.cn/app/appkey/

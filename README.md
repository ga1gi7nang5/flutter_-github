# Flutter实战 | 从 0 搭建「Github」APP

实现一个简单的Github客户端。这个应用的主要目标有两个：

1. 了解如何使用Flutter来开发一个完整APP，了解Flutter应用开发流程及工程结构等。
2. 对所学内容的应用及总结。

由于Github本身功能非常多，我们并不是去实现Github的所有业务功能。因此，我们只需要实现一个APP的骨架，能达到上面这两点即可。下面对我们要实现的功能如下：

1. 实现Github账号登录、退出登录功能
2. 登录后可以查看自己的项目主页
3. 支持换肤
4. 支持多语言
5. 登录状态可以持久化；

要实现上面这些功能会涉及到如下技术点：

1. 网络请求；需要请求Github API。
2. Json转Dart Model类；
3. 全局状态管理；语言、主题、登录态等都需要全局共享。
4. 持久化存储；保存登录信息，用户信息等。
5. 支持国际化、Intl包的使用

## APP代码结构

```
flutter_github
├─android (安卓应用相关文件)
├─fonts (外部Icon资源文件)
├─i18n-arb (各国语言对应的arb文件)
├─imgs (外部图片文件)
├─ios (ios应用相关文件)
├─jsons (保存json数据文件)
├─lib (工程主目录)
│  ├─common (一些工具类，如通用方法类、网络接口类、保存全局变量的静态类等)
│  ├─i18n (国际化相关的类)
│  ├─models (Json文件对应的Dart Model类)
│  ├─states (保存APP中需要跨组件共享的状态类)
│  ├─routes (存放所有路由页面类)
│  └─widgets (APP内封装的一些Widget组件都在该目录下)
└─test (测试目录)
```

## 生成Model类

```aidl
flutter packages pub run json_model
```

## 多语言开发流程

1. 在lib/i18n添加-localization_int.dart文件;
```aidl
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'messages_all.dart';

class GmLocalizations {

  static Future<GmLocalizations> load(Locale locale) {
    final String name = locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((b) {
      print('dd:$localeName');
      Intl.defaultLocale = localeName;
      return new GmLocalizations();
    });
  }

  static GmLocalizations of(BuildContext context) {
    return Localizations.of<GmLocalizations>(context, GmLocalizations);
  }

  String get title {
    return Intl.message(
      'Flutter APP',
      name: 'title',
      desc: 'Title for the Demo application',
    );
  }

  String get login => Intl.message('Login', name: 'login');
  String get language => Intl.message('Language', name: 'language');
}

//Locale代理类
class GmLocalizationsDelegate extends LocalizationsDelegate<GmLocalizations> {
  const GmLocalizationsDelegate();

  //是否支持某个Local
  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  // Flutter会调用此类加载相应的Locale资源类
  @override
  Future<GmLocalizations> load(Locale locale) {
    //3
    return GmLocalizations.load(locale);
  }

  // 当Localizations Widget重新build时，是否调用load重新加载Locale资源.
  @override
  bool shouldReload(GmLocalizationsDelegate old) => false;
}
```
2. 生成默认语言arb文件，运行下面命令行
```
flutter pub pub run intl_translation:extract_to_arb --output-dir=i18n-arb \ lib/i18n/localization_intl.dart
```

3. 复制默认语言arb文件，添加其他语言的文件， 运行下面命令行根据arb生成dart文件
```
flutter pub pub run intl_translation:generate_from_arb --output-dir=lib/i10n --no-use-deferred-loading lib/i10n/localization_intl.dart i10n-arb/intl_*.arb
```


## 优化功能点

1. 主题定制
2. 登录界面优化
3. 修复头像显示默认头像的问题
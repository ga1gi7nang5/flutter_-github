import 'package:flutter/material.dart';
import 'package:flutter_github/routes/setting/theme_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './export.dart';
import 'package:flutter_github/states/theme.dart';
import 'package:flutter_github/states/user.dart';
import 'package:flutter_github/states/local.dart';

void main() => Global.init().then((e) => runApp(MyApp()));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildCloneableWidget> [
        ChangeNotifierProvider.value(value: ThemeState()),
        ChangeNotifierProvider.value(value: UserState()),
        ChangeNotifierProvider.value(value: LocaleState()),
      ],
      child: Consumer2<ThemeState, LocaleState>(
        builder: (BuildContext context, themeState, localeState, Widget child) {
          print('MyApp重新构建');
          return MaterialApp(
            onGenerateTitle: (context){
              return GmLocalizations.of(context).language;
            },
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: themeState.theme,
            ),
            locale: localeState.getLocale(),
            //我们只支持美国英语和中文简体
            supportedLocales: [
              const Locale('en', 'US'), // 美国英语
              const Locale('zh', 'CN'), // 中文简体
              //其它Locales
            ],
            localizationsDelegates: [
              // 本地化的代理类
              GmLocalizationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            localeResolutionCallback: (Locale _locale, Iterable<Locale> supportedLocales) {
              if (localeState.getLocale() != null) {
                //如果已经选定语言，则不跟随系统
                return localeState.getLocale();
              }
              Locale locale;
              if (supportedLocales.contains(_locale)) {
                locale= _locale;
              } else {
                //如果系统语言不是中文简体或美国英语，则默认使用美国英语
                locale= Locale('en', 'US');
              }
              return locale;
            },
            home: WelcomePage(),
            routes: <String, WidgetBuilder>{
              "login": (context) => LoginPage(),
              "home": (context) => HomePage(),
              "setting": (context) => SettingPage(),
              "themes": (context) => ThemePage(),
              "language": (context) => LanguagePage(),
            }
          );
        },
      ),
    );
  }
}

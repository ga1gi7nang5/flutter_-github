import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './export.dart';
import 'package:flutter_github/states/theme.dart';
import 'package:flutter_github/states/user.dart';

void main() => Global.init().then((e) => runApp(MyApp()));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildCloneableWidget> [
        ChangeNotifierProvider.value(value: ThemeState()),
        ChangeNotifierProvider.value(value: UserState()),
      ],
      child: Consumer<ThemeState>(
        builder: (BuildContext context, themeState, Widget child) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: themeState.theme,
            ),
            home: WelcomePage(),
            routes: <String, WidgetBuilder>{
              "login": (context) => LoginPage(),
              "home": (context) => HomePage(),
            }
          );
        },
      ),
    );
  }
}

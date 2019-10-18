import 'dart:async';

import '../export.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>  with TickerProviderStateMixin {
  Timer _t;
  bool isLogin = false;

  @override
  void initState() {
    super.initState();
    isLogin = Global.profile.lastLogin != null;
    print(isLogin);
    if (isLogin) {
      _t = new Timer(const Duration(milliseconds: 1500), () {
        try {
          Navigator.pushAndRemoveUntil(context, PageRouteBuilder<Null>(
              pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) {
                return AnimatedBuilder(
                  animation: animation,
                  builder: (BuildContext context, Widget child) {
                    return Opacity(
                        opacity: animation.value,
                        child: new HomePage(title: '首页',)
                    );
                  },
                );
              }
          ), (Route route) => route == null);
        } catch (e) {

        }
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _t?.cancel();
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    // TODO: implement build
    return new Material(
      color: new Color.fromARGB(255, 0, 0, 0),
      child: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('imgs/logo-dark.png', width: ScreenUtil().setWidth(144), height: ScreenUtil().setWidth(144)),
            Padding(
              padding: EdgeInsets.only(top: ScreenUtil().setWidth(44), bottom: ScreenUtil().setWidth(30)),
              child: Text('Welcome to GitHub', style: TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(58), fontWeight: FontWeight.w600)),
            ),
            Text('GitHub Management Tool', style: TextStyle(color: Color(0xffa1a1a1), fontSize: ScreenUtil().setSp(26))),
            isLogin? Container() : Container(
              margin: EdgeInsets.only(top: ScreenUtil().setWidth(36)),
              width: ScreenUtil().setWidth(514),
              height: ScreenUtil().setWidth(90),
              child: RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "login");
                },
                color: Color(0xff28a745),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(90) / 2))),
                child: Text('Sign in', style: TextStyle(color: Color(0xff0d1917), fontSize: ScreenUtil().setSp(30)),),
              ),
            )
          ],
        ),
      )
    );
  }

}
import '../export.dart';
import 'package:flutter_github/states/user.dart';

class SettingPage extends StatelessWidget {
  final BorderSide borderStyle = BorderSide(width: ScreenUtil().setWidth(1), color: Color(0xffe1e4e8), style: BorderStyle.solid);

  @override
  Widget build(BuildContext context) {
    var gm = GmLocalizations.of(context);
    print('构建SettingPage:'+ gm.title);
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text('设置', style:  TextStyle(color: Colors.white, fontSize: 20.0),),
      ),
      body: Container(
        color: Color(0xfff6f8fa),
        child: Column(
          children: <Widget>[
            Menus(
              children: [
                MenuItem(title: '主题', onPressed: () {
                  Navigator.pushNamed(context, 'themes');
                }),
                MenuItem(title: gm.language, hasBorder: false, onPressed: () {
                  Navigator.pushNamed(context, 'language');
                }),
              ]
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "login");
              },
              behavior: HitTestBehavior.opaque,
              child: Container(
                margin: EdgeInsets.only(top: ScreenUtil().setWidth(30)),
                padding: EdgeInsets.only(top: ScreenUtil().setWidth(20), bottom: ScreenUtil().setWidth(20)),
                alignment: Alignment.center,
                child: Text('切换账号'),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(top: borderStyle, bottom: borderStyle)
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Provider.of<UserState>(context, listen: false).user = null;
                Navigator.pushNamedAndRemoveUntil(context, "login", (Route route) => route == null);
              },
              behavior: HitTestBehavior.opaque,
              child: Container(
                margin: EdgeInsets.only(top: ScreenUtil().setWidth(30)),
                padding: EdgeInsets.only(top: ScreenUtil().setWidth(20), bottom: ScreenUtil().setWidth(20)),
                alignment: Alignment.center,
                child: Text('退出登录'),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(top: borderStyle, bottom: borderStyle)
                ),
              ),
            )
          ]
        )
      ),
    );
  }
}
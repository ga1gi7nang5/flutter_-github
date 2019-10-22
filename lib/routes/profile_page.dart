import 'package:flutter/cupertino.dart';
import 'package:flutter_github/common/icons.dart';
import 'package:flutter_github/states/user.dart';
import 'package:flutter_github/widgets/index.dart';

import '../export.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  BorderSide borderStyle = BorderSide(width: ScreenUtil().setWidth(1), color: Color(0xffe1e4e8), style: BorderStyle.solid);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        color: Color(0xfff6f8fa),
        child: Column(
          children: <Widget>[
            _buildUserInfo(),
            Menus(children: [
              MenuItem(icon: MyIcons.activity, title: '贡献活动'),
              MenuItem(icon: MyIcons.organization, title: '我的团体'),
              MenuItem(icon: MyIcons.gists, title: '代码片段',hasBorder: false,)
            ],),
            Menus(children: [
              MenuItem(icon: MyIcons.setting1, title: '设置',hasBorder: false, onPressed: () {
                print('ddd');
                Navigator.pushNamed(context, 'setting');
              },)
            ],)
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfo() {
    return Consumer<UserState>(
      builder: (BuildContext context, UserState value, Widget child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: ScreenUtil().setWidth(142), bottom: ScreenUtil().setWidth(34)),
              color: Theme.of(context).accentColor,
              child: Column(
                children: <Widget>[
                  Container(
                    width: ScreenUtil().setWidth(140),
                    height: ScreenUtil().setWidth(140),
                    margin: EdgeInsets.only(bottom: ScreenUtil().setWidth(25)),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: ScreenUtil().setWidth(6), style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(70)))
                    ),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(value.user.avatar_url),
                      radius: 40.0,
                    ),
                  ),
                  Text(value.user.login, style: TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(36), fontWeight: FontWeight.w600),)
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(bottom: borderStyle)
              ),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                        padding: EdgeInsets.only(top: ScreenUtil().setWidth(20), bottom: ScreenUtil().setWidth(20)),
                        decoration: BoxDecoration(
                            border: Border(right: borderStyle)
                        ),
                        child:Column(
                          children: <Widget>[
                            Text(value.user.followers.toString(), style: TextStyle(color: Color(0xff4f4f4f),)),
                            Text('关注者')
                          ],
                        )
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: <Widget>[
                        Text(value.user.following.toString(), style: TextStyle(color: Color(0xff4f4f4f),)),
                        Text('关注了')
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      }
    );
  }
}


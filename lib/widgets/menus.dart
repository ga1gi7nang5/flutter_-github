import '../export.dart';

class Menus extends StatelessWidget {
  Menus({Key key, @required this.children}) : super(key: key);
  final List<MenuItem> children;

  final BorderSide borderStyle = BorderSide(width: ScreenUtil().setWidth(1), color: Color(0xffe1e4e8), style: BorderStyle.solid);



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setWidth(30)),
      padding: EdgeInsets.only(left: ScreenUtil().setWidth(40)),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: borderStyle, bottom: borderStyle)
      ),
      child: Column(
        children: children,
      ),
    );
  }

}

class MenuItem extends StatelessWidget {
  MenuItem({Key key, @required this.icon, @required this.title, this.hasBorder= true, this.onPressed}) : super(key: key);

  final IconData icon;
  final String title;
  final bool hasBorder;
  final VoidCallback onPressed;
  final BorderSide borderStyle = BorderSide(width: ScreenUtil().setWidth(1), color: Color(0xffe1e4e8), style: BorderStyle.solid);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        children: <Widget>[
          Icon(icon, color: Color(0Xff605f5f), size: 20.0,),
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
              padding: EdgeInsets.only(right: ScreenUtil().setWidth(40), top: ScreenUtil().setWidth(20), bottom: ScreenUtil().setWidth(20)),
              decoration: hasBorder ? BoxDecoration(
                border: Border(bottom: borderStyle)
              ) : null,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(title, style: TextStyle(color: Colors.black),),
                  new Icon(
                    Icons.chevron_right,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}
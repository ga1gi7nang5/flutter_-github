import '../export.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text('通知', style:  TextStyle(color: Colors.white, fontSize: 20.0),),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text('暂无消息', style: TextStyle(color: Colors.grey, fontSize: 26.0),),
      ),
    );
  }
}
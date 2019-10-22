import '../export.dart';

class RepositoriesPage extends StatefulWidget {
  @override
  _RepositoriesPageState createState() => _RepositoriesPageState();
}

class _RepositoriesPageState extends State<RepositoriesPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text('仓库', style:  TextStyle(color: Colors.white, fontSize: 20.0),),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text('暂无消息', style: TextStyle(color: Colors.grey, fontSize: 26.0),),
      ),
    );
  }
}
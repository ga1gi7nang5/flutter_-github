import '../export.dart';
import 'package:flukit/flukit.dart';

class StarPage extends StatefulWidget {
  @override
  _StarPageState createState() => _StarPageState();
}

class _StarPageState extends State<StarPage> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text('关注', style:  TextStyle(color: Colors.white, fontSize: 20.0),),
      ),
      body: InfiniteListView<Repo>(
        onRetrieveData: (int page, List<Repo> items, bool refresh) async {
          var data = await Git(context).getRepos(
            refresh: refresh,
            type: 'starred',
            queryParameters: {
              'page': page,
              'page_size': 20,
            },
          );
          //把请求到的新数据添加到items中
          items.addAll(data);
          return data.length > 0 && data.length % 20 == 0;
        },
        itemBuilder: (List list, int index, BuildContext ctx) {
          // 项目信息列表项
          return RepoItem(list[index]);
        },
      ),
    );
  }
}
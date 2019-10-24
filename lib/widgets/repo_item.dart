import 'package:flutter_github/common/icons.dart';
import 'package:flutter_github/export.dart';

class RepoItem extends StatelessWidget {
  RepoItem(this.repo) : super(key: ValueKey(repo.id));

  final Repo repo;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(top: ScreenUtil().setWidth(14), left: ScreenUtil().setWidth(14)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: ScreenUtil().setWidth(14)),
            child: CircleAvatar(
              backgroundImage: NetworkImage(repo.owner.avatar_url),
              radius: ScreenUtil().setWidth(33),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: ScreenUtil().setWidth(1), color: Color(0xffe1e4e8), style: BorderStyle.solid))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(repo.name, style: TextStyle(color: Color(0xff4781d3), fontSize: ScreenUtil().setSp(24)),),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(14)),
                    child: Text(repo.description, style: TextStyle(color: Color(0xff101010), fontSize: ScreenUtil().setSp(24)),),
                  ),
                  _buildBottom(repo)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  // 构建卡片底部信息
  Widget _buildBottom(repo) {
    Color textColor = Color(0xff686868);
    return DefaultTextStyle(
      style: TextStyle(color: textColor, fontSize: ScreenUtil().setSp(24)),
      child: Padding(
        padding: EdgeInsets.only(bottom: ScreenUtil().setWidth(14)),
        child: Builder(builder: (context){
          var children = <Widget>[
            Container(),
            Icon(Icons.star, size: ScreenUtil().setSp(28), color: textColor,),
            Padding(padding: EdgeInsets.only(left: ScreenUtil().setWidth(14), right: ScreenUtil().setWidth(30)),child: Text(repo.stargazers_count.toString()))
          ];
          if (repo.language != null) {
            children.insert(0, Padding(padding: EdgeInsets.only(right: ScreenUtil().setWidth(30)),child: Text(repo.language)));
          }
          if (repo.forks_count != 0) {
            children.add(Icon(MyIcons.fork, size: ScreenUtil().setSp(28), color: textColor,));
            children.add(Padding(padding: EdgeInsets.only(left: ScreenUtil().setWidth(14), right: ScreenUtil().setWidth(30)),child: Text(repo.forks_count.toString())));
          }
          String updateTime = RelativeDateFormat.format(DateTime.parse(repo.updated_at));
          children.add(Padding(padding: EdgeInsets.only(left: ScreenUtil().setWidth(14), right: ScreenUtil().setWidth(30)),child: Text('$updateTime更新')));
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children
          );
        }),
      ),
    );
  }
}
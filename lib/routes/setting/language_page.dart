import 'package:flutter_github/export.dart';
import 'package:flutter_github/states/local.dart';

class LanguagePage extends StatelessWidget {


  Widget _buildLanguageItem(BuildContext context, String lan, value) {
    var color = Theme.of(context).primaryColor;
    var localeModel = Provider.of<LocaleState>(context);
    return ListTile(
      title: Text(lan,
        // 对APP当前语言进行高亮显示
        style: TextStyle(color: localeModel.locale == value ? color : null),
      ),
      trailing: localeModel.locale == value ? Icon(Icons.done, color: color) : null,
      onTap: () {
        // 此行代码会通知MaterialApp重新build
        localeModel.locale = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('设置语言'),
      ),
      body: ListView(
        children: <Widget>[
          _buildLanguageItem(context, "中文简体", "zh_CN"),
          _buildLanguageItem(context, "English", "en_US"),
          _buildLanguageItem(context, "跟随系统", null),
        ],
      ),
    );
  }
}
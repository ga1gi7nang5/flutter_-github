
import 'package:flutter_github/export.dart';
import 'package:flutter_github/states/theme.dart';

class ThemePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          title: Text('设置主题'),
      ),
      body: ListView(
        children:  Global.themes.map<Widget>((e) {
          return GestureDetector(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
              child: Container(color: e, height: 40),
            ),
            onTap: () {
              //主题更新后，MaterialApp会重新build
              Provider.of<ThemeState>(context).theme = e;
            },
          );
        }).toList(),
      )
    );
  }
}
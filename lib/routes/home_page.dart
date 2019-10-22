import 'package:flutter_github/common/icons.dart';

import '../export.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LayoutType _layoutSelection = LayoutType.repositories;

  void _onSelectTab (index) {
    List<LayoutType> layoutTypeList = [LayoutType.repositories, LayoutType.star, LayoutType.notifications, LayoutType.profile];
    setState(() {
      _layoutSelection = layoutTypeList[index];
    });
  }

  Color _colorTabMatching({LayoutType layoutSelection}) {
    return _layoutSelection == layoutSelection ? Theme.of(context).accentColor : Colors.grey;
  }

  BottomNavigationBarItem _buildItem({IconData icon, LayoutType layoutSelection}) {
    String text = layoutName(layoutSelection);
    Color selectionColor = _colorTabMatching(layoutSelection: layoutSelection);
    return BottomNavigationBarItem(
        icon: Icon(icon, color: selectionColor,),
        title: Text(text, style: TextStyle(color: selectionColor, fontSize: 12.0),)
    );
  }

  Widget _buildButtonNavBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(
            icon: MyIcons.repositories,
            layoutSelection: LayoutType.repositories
        ),
        _buildItem(
            icon: MyIcons.star,
            layoutSelection: LayoutType.star
        ),
        _buildItem(
            icon: MyIcons.notifications,
            layoutSelection: LayoutType.notifications
        ),
        _buildItem(
            icon: MyIcons.profile,
            layoutSelection: LayoutType.profile
        ),
      ],
      onTap: _onSelectTab,
    );
  }

  Widget _buildBody() {
    LayoutType layoutSelection = _layoutSelection;
    switch (layoutSelection) {
      case LayoutType.repositories:
        return RepositoriesPage();
      case LayoutType.star:
        return StarPage();
      case LayoutType.notifications:
        return NotificationPage();
      case LayoutType.profile:
        return ProfilePage();
    }
    return RepositoriesPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _buildButtonNavBar(),
    );
  }
}
import 'package:flutter/foundation.dart';
import 'package:flutter_github/export.dart';

class ProfileChangeNotifier extends ChangeNotifier {
  @override
  void notifyListeners() {
    print('更新持久化');
    Global.saveProfile(); //保存Profile变更
    super.notifyListeners(); //通知依赖的Widget更新
  }
}
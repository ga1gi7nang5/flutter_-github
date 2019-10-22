import 'package:flutter/foundation.dart';

abstract class HasLayoutGroup {
  VoidCallback get onLayoutToggle;
}

enum LayoutType {
  repositories,
  star,
  notifications,
  profile
}

String layoutName(LayoutType layoutType) {
  switch (layoutType) {
    case LayoutType.repositories:
      return '仓库';
    case LayoutType.star:
      return '关注';
    case LayoutType.notifications:
      return '通知';
    case LayoutType.profile:
      return '我的';
  }
  return '';
}
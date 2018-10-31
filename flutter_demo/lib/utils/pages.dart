import 'package:flutter/widgets.dart';

class Page {
  final String title;
  final String subhead;
  final IconData icon;
  final String routeName;
  final WidgetBuilder buildRoute;
  final PageCategory category;

  Page(
      {@required this.title,
        @required this.subhead,
        @required this.icon,
        @required this.category,
        @required this.routeName,
        @required this.buildRoute});

  @override
  bool operator ==(other) {
    if (identical(this, other)) {
      return true;
    }
    if (runtimeType != other.runtimeType) {
      return false;
    }
    final Page typeOther = other;

    return typeOther.routeName == routeName &&
        title == typeOther.title &&
        subhead == typeOther.subhead;
  }

  @override
  int get hashCode => hashValues(title, subhead, routeName);

  @override
  String toString() {
    return '$runtimeType($title,$subhead,$routeName)';
  }
}


class PageCategory {
  final String title;
  final String subhead;
//  final BottomItem bottomItem;

  const PageCategory._(
      {final this.title, final this.subhead/*, final this.bottomItem*/});

  @override
  bool operator ==(other) {
    if (identical(this, other)) {
      return true;
    }
    if (runtimeType != other.runtimeType) {
      return false;
    }
    final PageCategory typeOther = other;
    return typeOther.title == title && typeOther.subhead == subhead;
  }
  @override
  int get hashCode => hashValues(title, subhead/*,bottomItem*/);
}

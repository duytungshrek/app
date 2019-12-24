import 'package:flutter/material.dart';
import 'package:typicons_flutter/typicons_flutter.dart';
import 'package:flutter/cupertino.dart';
class ListTab {
  const ListTab(this.title, this.icon);
  final String title;
  final IconData icon;
}

const List<ListTab> allTabs = <ListTab>[
  ListTab('Trang chủ', CupertinoIcons.home),
  ListTab('Danh mục', Typicons.th_large_outline),
  ListTab('Tìm kiếm', Icons.search),
  ListTab('Thông báo', Icons.notifications_none),
  ListTab('Cá nhân', Icons.person_outline),
];
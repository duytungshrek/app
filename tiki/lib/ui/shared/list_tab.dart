import 'package:flutter/material.dart';
class ListTab {
  const ListTab(this.title, this.icon);
  final String title;
  final IconData icon;
}

const List<ListTab> allTabs = <ListTab>[
  ListTab('Trang chủ', Icons.home),
  ListTab('Danh mục', Icons.list),
  ListTab('Tìm kiếm', Icons.search),
  ListTab('Thông báo', Icons.notifications_none),
  ListTab('Cá nhân', Icons.account_circle),
];
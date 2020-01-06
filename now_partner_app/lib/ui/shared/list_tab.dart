import 'package:flutter/material.dart';
import 'package:typicons_flutter/typicons_flutter.dart';
import 'package:flutter/cupertino.dart';
class ListTab {
  const ListTab(this.title, this.icon);
  final String title;
  final IconData icon;
}

const List<ListTab> allTabs = <ListTab>[
  ListTab('Đơn hàng', Icons.assignment),
  ListTab('Thu nhập', Icons.monetization_on),
  ListTab('Tin nhắn', CupertinoIcons.conversation_bubble),
  ListTab('Thông báo', Icons.notifications_none),
  ListTab('Cá nhân', Icons.person_outline),
];
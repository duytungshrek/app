import 'package:flutter/material.dart';
import 'package:tiki/scoped_models/tab_home_model.dart';
import 'package:tiki/ui/shared/flutter_screenutil.dart';
import 'package:tiki/ui/shared/list_tab.dart';
import 'package:tiki/ui/views/base_view.dart';
import 'package:tiki/ui/views/tab5.dart';
import 'package:tiki/ui/views/tab_category.dart';
import 'package:tiki/ui/views/tab_home.dart';
import 'package:tiki/ui/views/tab_notification.dart';
import 'package:tiki/ui/views/tab_search.dart';

class HomeView extends StatefulWidget {
  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 320, height: 568)..init(context);
    return BaseView<TabHomeModel>(onModelReady: (model) {
      model.fetchHomeProductData();
    }, builder: (context, child, model) {
      return Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: model.currentIndex,
            children: [
              TabHome(model),
              TabCategory(),
              TabSearch(),
              TabNotification(),
              Tab5(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: model.currentIndex,
          onTap: (int index) {
            model.changeIndex(index);
            print(model.currentIndex);
          },
          items: allTabs.map((ListTab tab) {
            return BottomNavigationBarItem(
                icon: Icon(tab.icon), title: Text(tab.title));
          }).toList(),
          selectedItemColor: Colors.blue,
          selectedLabelStyle: TextStyle(
              color: Colors.blue, fontSize: ScreenUtil.getInstance().setSp(12)),
          unselectedItemColor: Colors.black54,
          unselectedLabelStyle: TextStyle(
              color: Colors.black54,
              fontSize: ScreenUtil.getInstance().setSp(10)),
          showUnselectedLabels: true,
          elevation: 10,
        ),
      );
    });
  }
}

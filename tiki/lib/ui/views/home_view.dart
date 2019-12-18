import 'package:flutter/material.dart';
import 'package:tiki/scoped_models/home_view_model.dart';
import 'package:tiki/ui/shared/flutter_screenutil.dart';
import 'package:tiki/ui/shared/list_tab.dart';
import 'package:tiki/ui/views/base_view.dart';
import 'package:tiki/ui/views/tab4.dart';
import 'package:tiki/ui/views/tab5.dart';
import 'package:tiki/ui/views/tab_category.dart';
import 'package:tiki/ui/views/tab_home.dart';
import 'package:tiki/ui/views/tab_search.dart';

class HomeView extends StatefulWidget {
  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  static int currentIndex = 0;
  static int lastIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    TabHome(),
    TabCategory(),
    TabSearch(),
    Tab4(),
    Tab5(),
  ];


  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 320, height: 568)..init(context);
    return BaseView<HomeViewModel>(
        builder: (context, child, model){
          return Scaffold(
            body: SafeArea(
              child: IndexedStack(
                index: currentIndex,
                children: _widgetOptions,
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (int index) {
                setState(() {
                  lastIndex = currentIndex;
                  currentIndex = index;
                });
              },
              items: allTabs.map((ListTab tab) {
                return BottomNavigationBarItem(
                    icon: Icon(tab.icon),
                    title: Text(tab.title)
                );
              }).toList(),
              selectedItemColor: Colors.blue,
              selectedLabelStyle: TextStyle(color: Colors.blue,fontSize: ScreenUtil.getInstance().setSp(12)),
              unselectedItemColor: Colors.black54,
              unselectedLabelStyle: TextStyle(color: Colors.black54,fontSize: ScreenUtil.getInstance().setSp(10)),
              showUnselectedLabels: true,
              elevation: 10,
            ),
          );
        }
    );
  }
  static changeIndex(int index){
    lastIndex = currentIndex;
    currentIndex = index;
  }
}

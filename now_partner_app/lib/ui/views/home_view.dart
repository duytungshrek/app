import 'package:flutter/material.dart';
import 'package:now_partner/scoped_models/home_view_model.dart';
import 'package:now_partner/ui/shared/flutter_screenutil.dart';
import 'package:now_partner/ui/shared/list_tab.dart';
import 'package:now_partner/ui/views/base_view.dart';
import 'package:now_partner/ui/views/tab1.dart';
import 'package:now_partner/ui/views/tab2.dart';
import 'package:now_partner/ui/views/tab3.dart';
import 'package:now_partner/ui/views/tab4.dart';
import 'package:now_partner/ui/views/tab5.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 320, height: 568)..init(context);
    return  BaseView<HomeViewModel>(
        onModelReady: (model) {
          model.getLocation();
        },
        builder: (context, child, model) => Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: model.currentIndex,
              children: [
                Tab1(model),
                Tab2(),
                Tab3(),
                Tab4(),
                Tab5(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: model.currentIndex,
            onTap: (int index) {
              model.changeIndex(index);
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
            showUnselectedLabels: false,
            elevation: 10,
          ),
        ));
  }

}
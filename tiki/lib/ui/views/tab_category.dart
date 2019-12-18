import 'package:flutter/material.dart';
import 'package:tiki/models/types.dart';
import 'package:tiki/ui/shared/flutter_screenutil.dart';

class TabCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 320, height: 568)
      ..init(context);
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onTap: () {},
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(5),
              hintText: "Bạn tìm gì hôm nay... ",
              hintStyle: TextStyle(
                  fontSize: ScreenUtil.getInstance().setSp(14),
                  color: Colors.black87),
              filled: true,
              fillColor: Colors.white,
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(6)),
              )),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: List.generate(getListCategory().length, (index) {
          return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    height: ScreenUtil.getInstance().setHeight(60),
                    width: ScreenUtil.getInstance().setWidth(60),
                    child: Image.asset(
                      getListCategory()[index].icon,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: ScreenUtil.getInstance().setHeight(30),
                    width: ScreenUtil.getInstance().setWidth(80),
                    margin: EdgeInsets.all(5),
                    child: Text(
                      getListCategory()[index].name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: ScreenUtil.getInstance().setSp(12)),
                    ),
                  )
                ],
              ),
          );
        }),
      ),
    );
  }

  List<Category> getListCategory() {
    Types types = Types();
    List<Category> list = types.getListCategory();
    return list;
  }
}

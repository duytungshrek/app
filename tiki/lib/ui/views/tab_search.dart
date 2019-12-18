import 'package:flutter/material.dart';
import 'package:tiki/models/types.dart';
import 'package:tiki/ui/shared/flutter_screenutil.dart';

class TabSearch extends StatefulWidget {
  @override
  _TabSearchState createState() => _TabSearchState();
}

class _TabSearchState extends State<TabSearch> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 320, height: 568)..init(context);
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
          backgroundColor: Colors.white,
          title: TextField(
            onTap: () {

            },
            textInputAction: TextInputAction.search,
            onSubmitted: (str) {},
            decoration: InputDecoration(
              hintText: "Sản phẩm, thương hiệu và mọi thứ bạn cần... ",
              hintStyle: TextStyle(color: Colors.black87),
            ),
          )),
      body: Container(
        height: ScreenUtil.getInstance().setHeight(300),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: ScreenUtil.getInstance().setWidth(20),
                  height: ScreenUtil.getInstance().setHeight(20),
                  margin: EdgeInsets.all(10),
                  child: Image.asset(
                    "images/trending.png",
                    fit: BoxFit.contain,
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Text(
                      "Từ Khóa Hót",
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: ScreenUtil.getInstance().setSp(14),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            Wrap(
              spacing: 10, // gap between adjacent chips
              runSpacing: 10, // gap between lines
              children: generateTags(),
            )
          ],
        ),
      ),
    );
  }

  List<String> getWord() {
    Types types = Types();
    return types.getKeyWord();
  }

  List<Chip> generateTags() {
    return getWord().map((tag) => getChip(tag)).toList();
  }

  Chip getChip(String name) {
    return Chip(
        backgroundColor: Color(0xFFeeeeee),
        shape: RoundedRectangleBorder(),
        labelStyle: TextStyle(color: Colors.black87),
        label: Text(name));
  }
}

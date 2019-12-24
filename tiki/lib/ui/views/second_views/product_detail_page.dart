import 'package:flutter/material.dart';
import 'package:tiki/ui/shared/flutter_screenutil.dart';
import 'package:tiki/ui/views/first_views/home_view.dart';
import 'package:tiki/ui/views/first_views/tab_category.dart';
import 'package:tiki/ui/views/first_views/tab_profile.dart';
import 'package:tiki/ui/views/first_views/tab_search.dart';
import 'package:typicons_flutter/typicons_flutter.dart';

class ProductDetailPage extends StatefulWidget {
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 320, height: 568)..init(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TabSearch()));
              }),
          IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeView()));
              }),
          IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TabSearch()));
              }),
          _simplePopupMenu(),
        ],
      ),
    );
  }

  Widget _simplePopupMenu() => PopupMenuButton<int>(
        itemBuilder: (context) => [
          PopupMenuItem(
            value: 1,
            child: ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeView()));
              },
              dense: true,
              leading: Icon(
                Typicons.home_outline,
                color: Colors.white,
                size: ScreenUtil.getInstance().setSp(18),
              ),
              title: Text(
                "Trở về trang chủ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil.getInstance().setSp(12)),
              ),
              contentPadding: EdgeInsets.all(0),
            ),
          ),
          PopupMenuItem(
            value: 2,
            child: ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TabCategory()));
              },
              dense: true,
              leading: Icon(
                Typicons.th_large_outline,
                color: Colors.white,
                size: ScreenUtil.getInstance().setSp(18),
              ),
              title: Text(
                "Danh mục sản phẩm",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil.getInstance().setSp(12)),
              ),
              contentPadding: EdgeInsets.all(0),
            ),
          ),
          PopupMenuItem(
            value: 3,
            child: ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TabProfile()));
              },
              dense: true,
              leading: Icon(
                Icons.person_outline,
                color: Colors.white,
                size: ScreenUtil.getInstance().setSp(18),
              ),
              title: Text(
                "Cá nhân",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil.getInstance().setSp(12)),
              ),
              contentPadding: EdgeInsets.all(0),
            ),
          ),
          PopupMenuItem(
            value: 4,
            child: ListTile(
              dense: true,
              leading: Icon(
                Icons.favorite_border,
                color: Colors.white,
                size: ScreenUtil.getInstance().setSp(18),
              ),
              title: Text(
                "Yêu thích",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil.getInstance().setSp(12)),
              ),
              contentPadding: EdgeInsets.all(0),
            ),
          ),
          PopupMenuItem(
            value: 5,
            child: ListTile(
              dense: true,
              leading: Icon(
                Icons.share,
                color: Colors.white,
                size: ScreenUtil.getInstance().setSp(18),
              ),
              title: Text(
                "Chia sẻ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil.getInstance().setSp(12)),
              ),
              contentPadding: EdgeInsets.all(0),
            ),
          ),
        ],
        offset: Offset(0, 100),
        color: Color(0xFF434343),
        child: Icon(Icons.more_horiz),
      );
}

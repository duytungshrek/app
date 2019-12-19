import 'package:flutter/material.dart';
import 'package:tiki/ui/shared/flutter_screenutil.dart';

class TabProfile extends StatefulWidget {
  @override
  _TabProfileState createState() => _TabProfileState();
}

class _TabProfileState extends State<TabProfile> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 320, height: 568)..init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Cá nhân"),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {})
        ],
      ),
      backgroundColor: Colors.white,
      body: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        children: <Widget>[
          Container(
              height: ScreenUtil.getInstance().setHeight(70),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Icon(
                      Icons.account_circle,
                      color: Colors.blue,
                      size: ScreenUtil.getInstance().setSp(50),
                    ),
                    flex: 2,
                  ),
                  Expanded(
                    flex: 7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Chào mừng bạn đến với Magenest",
                          style: TextStyle(
                              fontSize: ScreenUtil.getInstance().setSp(12)),
                        ),
                        Text(
                          "Đăng nhập/Đăng ký",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: ScreenUtil.getInstance().setSp(16)),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Icon(
                      Icons.chevron_right,
                      size: ScreenUtil.getInstance().setSp(20),
                    ),
                    flex: 1,
                  )
                ],
              )),
          Container(
            height: ScreenUtil.getInstance().setHeight(5),
            color: Colors.grey,
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.assignment,),
                Expanded(
                  child: Container(
                    child: Text("Quản lý đơn hàng",style: TextStyle(fontSize: ScreenUtil.getInstance().setSp(12)),),
                    margin: EdgeInsets.all(5),
                  ),
                ),
                Icon(Icons.navigate_next)
              ],
            ),
          ),
          Divider(
            height: 0,
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.shopping_cart),
                Expanded(
                  child: Container(
                    child: Text("Sản phẩm đã mua",style: TextStyle(fontSize: ScreenUtil.getInstance().setSp(12)),),
                    margin: EdgeInsets.all(5),
                  ),
                ),
                Icon(Icons.navigate_next)
              ],
            ),
          ),
          Divider(
            height: 0,
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.remove_red_eye),
                Expanded(
                  child: Container(
                    child: Text("Sản phẩm đã xem",style: TextStyle(fontSize: ScreenUtil.getInstance().setSp(12)),),
                    margin: EdgeInsets.all(5),
                  ),
                ),
                Icon(Icons.navigate_next)
              ],
            ),
          ),
          Divider(
            height: 0,
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.favorite_border),
                Expanded(
                  child: Container(
                    child: Text("Sản phẩm yêu thích",style: TextStyle(fontSize: ScreenUtil.getInstance().setSp(12)),),
                    margin: EdgeInsets.all(5),
                  ),
                ),
                Icon(Icons.navigate_next)
              ],
            ),
          ),
          Divider(
            height: 0,
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.turned_in_not),
                Expanded(
                  child: Container(
                    child: Text("Sản phẩm mua sau",style: TextStyle(fontSize: ScreenUtil.getInstance().setSp(12)),),
                    margin: EdgeInsets.all(5),
                  ),
                ),
                Icon(Icons.navigate_next)
              ],
            ),
          ),
          Divider(
            height: 0,
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.comment),
                Expanded(
                  child: Container(
                    child: Text("Nhận xét của tôi",style: TextStyle(fontSize: ScreenUtil.getInstance().setSp(12)),),
                    margin: EdgeInsets.all(5),
                  ),
                ),
                Icon(Icons.navigate_next)
              ],
            ),
          ),
          Divider(
            height: 0,
          ),
          Container(
            height: ScreenUtil.getInstance().setHeight(5),
            color: Colors.grey,
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Text("Ưu đãi cho chủ thẻ ngân hàng",style: TextStyle(fontSize: ScreenUtil.getInstance().setSp(12)),),
                    margin: EdgeInsets.all(5),
                  ),
                ),
                Icon(Icons.navigate_next)
              ],
            ),
          ),
          Divider(
            height: 0,
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Text("HOT LINE: 1900 100có",style: TextStyle(fontSize: ScreenUtil.getInstance().setSp(12)),),
                    margin: EdgeInsets.all(5),
                  ),
                ),
                Icon(Icons.navigate_next)
              ],
            ),
          ),
          Divider(
            height: 0,
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Text("Cài đặt",style: TextStyle(fontSize: ScreenUtil.getInstance().setSp(12)),),
                    margin: EdgeInsets.all(5),
                  ),
                ),
                Icon(Icons.navigate_next)
              ],
            ),
          ),
          Divider(
            height: 0,
          ),
          Container(
            height: ScreenUtil.getInstance().setHeight(5),
            color: Colors.grey,
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.headset),
                Expanded(
                  child: Container(
                    child: Text("Hỗ trợ",style: TextStyle(fontSize: ScreenUtil.getInstance().setSp(12)),),
                    margin: EdgeInsets.all(5),
                  ),
                ),
                Icon(Icons.navigate_next)
              ],
            ),
          ),
          Divider(
            height: 0,
          ),
          Container(
            height: ScreenUtil.getInstance().setHeight(15),
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}

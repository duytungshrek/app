import 'package:flutter/material.dart';
import 'package:tiki/scoped_models/tab_home_model.dart';
import 'package:tiki/ui/shared/flutter_screenutil.dart';


class HomeCategory extends StatefulWidget {
  final TabHomeModel model;

  const HomeCategory(this.model);

  @override
  _HomeCategoryState createState() => _HomeCategoryState();
}

class _HomeCategoryState extends State<HomeCategory> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 320, height: 568)..init(context);
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                "  Danh mục sản phẩm ",
                style: TextStyle(
                    fontSize: ScreenUtil.getInstance().setSp(14),
                    fontWeight: FontWeight.bold),
              ),
              width: ScreenUtil.getInstance().setWidth(200),
            ),
            Expanded(
              child: Container(
                alignment: AlignmentDirectional.topEnd,
                margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                child: FlatButton(
                  padding: EdgeInsets.all(0),
                  child: Text(
                    "XEM THÊM ",
                    style: TextStyle(
                        fontSize: ScreenUtil.getInstance().setSp(14),
                        color: Colors.blue),
                  ),
                  onPressed: () {
                    widget.model.changeIndex(1);
                  },
                ),
              ),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.start,
        ),
        Expanded(
          child: Container(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                buildListCategory("images/category/1.png", "Đồ Chơi - Mẹ & Bé",
                    "images/category/2.png", "Điện Thoại - Máy Tính Bảng"),
                buildListCategory("images/category/3.png", "Làm Đẹp - Sức Khỏe",
                    "images/category/4.png", "Điện Gia Dụng"),
                buildListCategory("images/category/5.png", "Thời Trang",
                    "images/category/6.png", "Điện Tử - Điện Lạnh"),
                buildListCategory("images/category/7.png", "Nhà Cửa - Đời Sống",
                    "images/category/8.png", "Hàng Quốc Tế"),
                buildListCategory("images/category/9.png", "Bách Hóa Online",
                    "images/category/10.png", "Thiết Bị Số - Phụ Kiện Số"),
                buildListCategory("images/category/11.png", "Voucher - Dịch Vụ",
                    "images/category/12.png", "Ô Tô - Xe Máy - Xe Đạp"),
                buildListCategory("images/category/13.png", "Nhà Sách Tiki",
                    "images/category/14.png", "Laptop - Máy Vi Tính - Linh Kiện"),
                buildListCategory("images/category/15.png", "Thể Thao - Dã Ngoại",
                    "images/category/16.png", "Máy Ảnh - Máy Quay Phim"),
              ],
            ),
          ),
        )
      ],
    );
  }

  buildListCategory(String imageLink1, String description1, String imageLink2,
      String description2) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                height: ScreenUtil.getInstance().setHeight(50),
                width: ScreenUtil.getInstance().setWidth(50),
                child: Image.asset(
                  imageLink1,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: ScreenUtil.getInstance().setHeight(30),
                width: ScreenUtil.getInstance().setWidth(70),
                margin: EdgeInsets.all(5),
                child: Text(
                  description1,textAlign: TextAlign.center,
                  style: TextStyle(fontSize: ScreenUtil.getInstance().setSp(12)),
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                height: ScreenUtil.getInstance().setHeight(50),
                width: ScreenUtil.getInstance().setWidth(50),
                child: Image.asset(
                  imageLink2,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: ScreenUtil.getInstance().setHeight(30),
                width: ScreenUtil.getInstance().setWidth(70),
                margin: EdgeInsets.all(5),
                child: Text(
                  description2,textAlign: TextAlign.center,
                  style: TextStyle(fontSize: ScreenUtil.getInstance().setSp(12)),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class HomeService extends StatefulWidget {
  @override
  _HomeServiceState createState() => _HomeServiceState();
}

class _HomeServiceState extends State<HomeService> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              child: Text(
                "  Dịch vụ tiện ích ",
                style: TextStyle(
                    fontSize: ScreenUtil.getInstance().setSp(14),
                    fontWeight: FontWeight.bold),
              ),
              width: ScreenUtil.getInstance().setWidth(200),
            ),
            Expanded(
              child: Container(
                alignment: AlignmentDirectional.topEnd,
                margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                child: FlatButton(
                  padding: EdgeInsets.all(0),
                  child: Text(
                    "XEM THÊM ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: ScreenUtil.getInstance().setSp(14),
                        color: Colors.blue),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.start,
        ),
        Expanded(
          child: Container(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                buildListService("images/service/1.png", "Mua thẻ điện thoại"),
                buildListService("images/service/2.png", "Vé máy bay"),
                buildListService("images/service/3.png", "Phiếu quà tặng"),
                buildListService("images/service/4.png", "Nạp tiền điện thoại"),
                buildListService("images/service/5.png", "Thẻ Game"),
                buildListService("images/service/6.png", "Mua bảo hiểm online"),
                buildListService("images/service/7.png", "Thẻ 3G/4G"),
                buildListService("images/service/8.png", "Đặt phòng Booking"),
                buildListService("images/service/9.png", "Bảo hiểm du lịch Liberty "),
              ],
            ),
          ),
        )
      ],
    );
  }

  buildListService(String imageLink, String description) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Image.asset(imageLink,fit: BoxFit.cover,),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
            height: ScreenUtil.getInstance().height*5/100,
            width: ScreenUtil.getInstance().width*20/100,
            child: Text(description,textAlign: TextAlign.center,
            style: TextStyle(fontSize: ScreenUtil.getInstance().setSp(12)),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,),
          )
        ],
      ),
    );
  }
}


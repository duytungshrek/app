import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:tiki/scoped_models/tab_home_model.dart';
import 'package:tiki/ui/shared/flutter_screenutil.dart';
import 'package:tiki/ui/views/first_views/home_view.dart';
import 'package:tiki/ui/views/first_views/tab_category.dart';
import 'package:tiki/ui/views/first_views/tab_profile.dart';
import 'package:tiki/ui/views/first_views/tab_search.dart';
import 'package:typicons_flutter/typicons_flutter.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetailPage extends StatefulWidget {
  final TabHomeModel model;

  const ProductDetailPage(this.model);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int value = 0;
  SwiperController swipeController = SwiperController();
  int percent = (100 - 16990000 / 24990000 * 100).round();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 320, height: 568)..init(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
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
      body: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        children: <Widget>[
          _viewImage(),
          Container(
            margin: EdgeInsets.fromLTRB(10, 2, 10, 2),
            child: Text(
              "Laptop Xiaomi Mi Air JYU4063GL Core i5-8250U/Win10 (13.3 inch - Global Version) - Grey - Hàng Chính Hãng DGW",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: ScreenUtil.getInstance().setSp(14),
                  color: Colors.black),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 2, 10, 2),
            height: ScreenUtil.getInstance().setHeight(20),
            width: ScreenUtil.getInstance().setWidth(100),
            alignment: AlignmentDirectional.topStart,
            child: Row(
              children: <Widget>[
                FittedBox(
                  fit: BoxFit.contain,
                  child: RatingBar(
                    initialRating: 3.5,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    ignoreGestures: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ),
                Text(
                  "(XEM $value NHẬN XÉT)",
                  style: TextStyle(
                      fontSize: ScreenUtil.getInstance().setSp(12),
                      color: Colors.blue),
                ),
              ],
            ),
          ),
          Container(
            height: ScreenUtil.getInstance().setHeight(40),
            margin: EdgeInsets.fromLTRB(10, 2, 10, 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.model.formatMoney(16990000) + "₫  ",
                  style: TextStyle(
                    fontSize: ScreenUtil.getInstance().setSp(20),
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  widget.model.formatMoney(24990000) + "₫  ",
                  style: TextStyle(
                      fontSize: ScreenUtil.getInstance().setSp(14),
                      decoration: TextDecoration.lineThrough),
                ),
                Text(
                  "  -$percent%",
                  style: TextStyle(
                      fontSize: ScreenUtil.getInstance().setSp(14),
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 2, 10, 2),
            child: RaisedButton(
              child: Text(
                "Chọn Mua",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenUtil.getInstance().setSp(14)),
              ),
              color: Color(0xFFff424e),
              onPressed: () {},
            ),
          ),
          Container(
            height: ScreenUtil.getInstance().setHeight(5),
            color: Colors.grey,
          ),
          Container(
            height: ScreenUtil.getInstance().setHeight(120),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      child: Image.asset(
                        "images/check_shield.png",
                        fit: BoxFit.cover,
                      ),
                      height: ScreenUtil.getInstance().setHeight(30),
                      width: ScreenUtil.getInstance().setWidth(30),
                    ),
                    Container(
                      width: ScreenUtil.getInstance().setWidth(100),
                      child: RichText(
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        text: TextSpan(
                          text: 'Bồi thường\n',
                          style: TextStyle(
                              fontSize: ScreenUtil.getInstance().setSp(14),
                              color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                                text: '111%\n',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        ScreenUtil.getInstance().setSp(14))),
                            TextSpan(
                                text: 'nếu hàng giả',
                                style: TextStyle(
                                    fontSize:
                                        ScreenUtil.getInstance().setSp(14))),
                          ],
                        ),
                      ),
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                ),
                Column(
                  children: <Widget>[
                    Container(
                      child: Image.asset(
                        "images/check_square.png",
                        fit: BoxFit.cover,
                      ),
                      height: ScreenUtil.getInstance().setHeight(30),
                      width: ScreenUtil.getInstance().setWidth(30),
                    ),
                    Container(
                      width: ScreenUtil.getInstance().setWidth(100),
                      child: RichText(
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        text: TextSpan(
                          text: 'Kiểm tra\n',
                          style: TextStyle(
                              fontSize: ScreenUtil.getInstance().setSp(14),
                              color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'hàng hóa\n',
                                style: TextStyle(
                                    fontSize:
                                        ScreenUtil.getInstance().setSp(14))),
                            TextSpan(
                                text: 'khi nhận hàng',
                                style: TextStyle(
                                    fontSize:
                                        ScreenUtil.getInstance().setSp(14))),
                          ],
                        ),
                      ),
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                ),
                Column(
                  children: <Widget>[
                    Container(
                      child: Image.asset(
                        "images/re_square.png",
                        fit: BoxFit.cover,
                      ),
                      height: ScreenUtil.getInstance().setHeight(30),
                      width: ScreenUtil.getInstance().setWidth(30),
                    ),
                    Container(
                      width: ScreenUtil.getInstance().setWidth(100),
                      child: RichText(
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        text: TextSpan(
                          text: 'Đổi trả trong\n',
                          style: TextStyle(
                              fontSize: ScreenUtil.getInstance().setSp(14),
                              color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                                text: '30 ngày\n',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        ScreenUtil.getInstance().setSp(14))),
                            TextSpan(
                                text: 'nếu sp lỗi',
                                style: TextStyle(
                                    fontSize:
                                        ScreenUtil.getInstance().setSp(14))),
                          ],
                        ),
                      ),
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                ),
              ],
            ),
          ),
          Container(
            height: ScreenUtil.getInstance().setHeight(5),
            color: Colors.grey,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
            height: ScreenUtil.getInstance().setHeight(3*40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "Các Ưu Đãi Khác",
                  style: TextStyle(
                      fontSize: ScreenUtil.getInstance().setSp(16),
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.info_outline,
                      color: Colors.blue,
                      size: ScreenUtil.getInstance().setSp(20),
                    ),
                    Container(
                      width: ScreenUtil.getInstance().width,
                      child: Text(
                        "Thẻ VietinBank, giảm 100k cho đơn hàng từ 5 triệu",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: ScreenUtil.getInstance().setSp(14),
                            color: Colors.black),
                      ),
                    ),
                    Icon(
                      Icons.navigate_next,
                      size: ScreenUtil.getInstance().setSp(18),
                    ),
                  ],
                ),
                Divider(
                  height: 0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.info_outline,
                      color: Colors.blue,
                      size: ScreenUtil.getInstance().setSp(20),
                    ),
                    Container(
                      width: ScreenUtil.getInstance().width,
                      child: Text(
                        "Thẻ SHB, giảm 100k cho đơn hàng từ 5 triệu",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: ScreenUtil.getInstance().setSp(14),
                            color: Colors.black),
                      ),
                    ),
                    Icon(
                      Icons.navigate_next,
                      size: ScreenUtil.getInstance().setSp(18),
                    ),
                  ],
                ),
                Divider(
                  height: 0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.info_outline,
                      color: Colors.blue,
                      size: ScreenUtil.getInstance().setSp(20),
                    ),
                    Container(
                      width: ScreenUtil.getInstance().width,
                      child: Text(
                        "Thẻ Timo, giảm 100k cho đơn hàng từ 5 triệu",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: ScreenUtil.getInstance().setSp(14),
                            color: Colors.black),
                      ),
                    ),
                    Icon(
                      Icons.navigate_next,
                      size: ScreenUtil.getInstance().setSp(18),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            color: Colors.grey,
            height: ScreenUtil.getInstance().setHeight(5),
          ),
          Container(
            height: ScreenUtil.getInstance().height,
            margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "Thông Tin Chi Tiết",
                  style: TextStyle(
                      fontSize: ScreenUtil.getInstance().setSp(16),
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _viewImage() => Container(
        height: ScreenUtil.getInstance().setHeight(350),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 83,
              child: Container(
                child: Swiper(
                  autoplayDelay: 5,
                  autoplay: false,
                  fade: 0.8,
                  controller: swipeController,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                        vertical: ScreenUtil.getInstance().setHeight(10),
                      ),
                      margin: EdgeInsets.fromLTRB(5, 1, 5, 1),
                      color: Colors.white,
                      child: Image.asset(
                        "images/hot${index + 1}.jpg",
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                  onIndexChanged: (int a) {
                    setState(() {
                      value = a;
                    });
                  },
                  itemCount: 5,
                ),
              ),
            ),
            Expanded(
              flex: 17,
              child: Container(
                margin: EdgeInsets.only(
                  left: ScreenUtil.getInstance().setWidth(8),
                ),
                padding: EdgeInsets.only(
                  bottom: ScreenUtil.getInstance().setHeight(8),
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: <Widget>[
                        InkWell(
                          child: ColorFiltered(
                            colorFilter: ColorFilter.mode(
                                Colors.white
                                    .withOpacity((value == index) ? 1 : 0.2),
                                BlendMode.dstATop),
                            child: Container(
                              decoration: BoxDecoration(
                                border: (value == index)
                                    ? Border.all(
                                        color: Colors.blue,
                                        width: ScreenUtil.getInstance()
                                            .setWidth(1))
                                    : Border.all(
                                        color: Colors.white,
                                        width: ScreenUtil.getInstance()
                                            .setWidth(1)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              width: ScreenUtil.getInstance().setWidth(50),
                              height: double.infinity,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "images/hot${index + 1}.jpg"),
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              value = index;
                              swipeController.move(value).whenComplete(() {
                                print("Click Image");
                              });
                            });
                          },
                        ),
                        SizedBox(
                          width: ScreenUtil.getInstance().setWidth(8),
                        )
                      ],
                    );
                  },
                ),
              ),
            )
          ],
        ),
      );

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

import 'dart:async';
import 'package:countdown_flutter/countdown_flutter.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:tiki/enums/view_state.dart';
import 'package:tiki/models/types.dart';
import 'package:tiki/scoped_models/tab_home_model.dart';
import 'package:tiki/ui/shared/flutter_screenutil.dart';
import 'package:tiki/ui/widgets/bestseller_category.dart';
import 'package:tiki/ui/widgets/coffee_category.dart';
import 'package:tiki/ui/widgets/cup_category.dart';
import 'package:tiki/ui/widgets/flash_sale.dart';
import 'package:tiki/ui/widgets/new_category.dart';
import 'package:tiki/ui/widgets/wg_category.dart';

class TabHome extends StatefulWidget {
  final TabHomeModel model;

  const TabHome(this.model);

  @override
  _TabHomeState createState() => _TabHomeState();
}

class _TabHomeState extends State<TabHome> {
  PageController _pageController = PageController(
    initialPage: 0,
  );
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 15) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  Types types = Types();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 320, height: 568)..init(context);
    return Scaffold(
      backgroundColor: Colors.grey,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            leading: null,
            title: Text(
              "TIKI",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: Icon(Icons.shopping_cart),
              )
            ],
            centerTitle: true,
            elevation: 0,
            pinned: false,
          ),
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            title: TextField(
              onTap: () {
                widget.model.changeIndex(2);
              },
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
          ),
          SliverToBoxAdapter(
            child: Container(
                height: ScreenUtil.getInstance().setHeight(120),
                color: Colors.white,
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  children: buildListTiles(),
                  controller: _pageController,
                )),
          ),
          SliverToBoxAdapter(
            child: Container(
                color: Colors.white,
                height: ScreenUtil.getInstance().setHeight(70),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        widget.model.changeIndex(1);
                      },
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Image.asset("images/danhmuc.png"),
                            height: ScreenUtil.getInstance().setHeight(50),
                          ),
                          Text(
                            "Danh mục",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: ScreenUtil.getInstance().setSp(12)),
                          )
                        ],
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          child: Image.asset("images/tikilive.png"),
                          height: ScreenUtil.getInstance().setHeight(50),
                        ),
                        Text(
                          "TikiLIVE",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: ScreenUtil.getInstance().setSp(12)),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          child: Image.asset("images/tikideal.png"),
                          height: ScreenUtil.getInstance().setHeight(50),
                        ),
                        Text(
                          "Tiki Deal",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: ScreenUtil.getInstance().setSp(12)),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          child: Image.asset("images/thequa.png"),
                          height: ScreenUtil.getInstance().setHeight(50),
                        ),
                        Text(
                          "Thẻ quà",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: ScreenUtil.getInstance().setSp(12)),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          child: Image.asset("images/tikinow.png"),
                          height: ScreenUtil.getInstance().setHeight(50),
                        ),
                        Text(
                          "TikiNOW",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: ScreenUtil.getInstance().setSp(12)),
                        )
                      ],
                    ),
                  ],
                )),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
              color: Color(0xFF105aae),
              height: ScreenUtil.getInstance().height / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          child: Image.asset(
                            "images/flash_deal.png",
                            fit: BoxFit.cover,
                          ),
                          width: ScreenUtil.getInstance().width * 30 / 100,
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          width: ScreenUtil.getInstance().width * 45 / 100,
                          child: FittedBox(
                            child: buildCountdown(),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: Color(0xFF1369cb),
                            child: FlatButton(
                                padding: EdgeInsets.all(0),
                                onPressed: null,
                                child: Text(
                                  "XEM THÊM",
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Colors.white,
                    ),
                    child: widget.model.state == ViewState.Busy
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : FlashSale(widget.model),
                  )),
                  Container(
                    height: 10,
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Container(
            margin: EdgeInsets.fromLTRB(0, 2, 0, 2),
            height: ScreenUtil.getInstance().setHeight(250),
            color: Colors.white,
            child: HomeCategory(widget.model),
          )),
          SliverToBoxAdapter(
              child: Container(
            margin: EdgeInsets.fromLTRB(0, 2, 0, 2),
            height: ScreenUtil.getInstance().setHeight(120),
            color: Colors.white,
            child: HomeService(),
          )),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 2, 0, 2),
              height: ScreenUtil.getInstance().setHeight(115),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        child: Text(
                          "  Tìm kiếm nổi bật  ",
                          style: TextStyle(
                              fontSize: ScreenUtil.getInstance().setSp(14),
                              fontWeight: FontWeight.bold),
                        ),
                        margin: EdgeInsets.all(10),
                        width: ScreenUtil.getInstance().setWidth(215),
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                  Expanded(
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Row(
                              children: listSearch(),
                            ),
                            Row(
                              children: listSearch(),
                            ),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              widget.model.state == ViewState.Busy
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : BestsellerCategory(
                      "https://salt.tikicdn.com/cache/w885/ts/banner/5c/b1/a5/3a9c361b3c418b8be71b3e08eadd4328.png",
                      widget.model),
              widget.model.state == ViewState.Busy
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : NewCategory(
                      "https://salt.tikicdn.com/cache/w885/ts/banner/63/e2/05/93fbd2f36d401276db830116ca9cb2ce.jpg",
                      widget.model),
              widget.model.state == ViewState.Busy
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : CupCategory(
                      "https://salt.tikicdn.com/cache/w885/ts/banner/da/70/d7/37bf047b349b47721add7b888b766df8.jpg",
                      widget.model),
              widget.model.state == ViewState.Busy
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : CoffeeCategory(
                      "https://salt.tikicdn.com/cache/w885/ts/banner/31/ce/87/b7c8ec03fe33c0935b60301cf98b2cb4.jpg",
                      widget.model),
            ]),
          ),
        ],
      ),
    );
  }

  List<Widget> buildListTiles() {
    Types type = Types();
    List<Category> list = type.getListCategory();
    List<Container> containers =
        new List<Container>.generate(list.length, (int index) {
      return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(list[index].bannerLink), fit: BoxFit.cover),
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        margin: EdgeInsets.all(10),
      );
    });
    return containers;
  }

  buildCountdown() {
    return Container(
      color: Color(0xFF105aae),
      child: Countdown(
        duration: Duration(seconds: 14400),
        builder: (BuildContext context, Duration remaining) {
          String date = remaining.toString();
          var save = date.split('.');
          var time = save[0].split(':');

          return Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                height: 40,
                width: 40,
                alignment: Alignment.center,
                decoration: new BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      stops: [
                        0.1,
                        0.5,
                        0.9
                      ],
                      colors: [
                        Color(0xFF024087),
                        Color(0xFF024087),
                        Color(0xFF024087)
                      ]),
                  shape: BoxShape.rectangle,
                ),
                child: Text(time[0],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    )),
              ),
              Container(
                padding: EdgeInsets.all(10),
                height: 40,
                width: 30,
                alignment: Alignment.center,
                child: Text(":",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16,
                    )),
              ),
              Container(
                padding: EdgeInsets.all(10),
                height: 40,
                width: 40,
                alignment: Alignment.center,
                decoration: new BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      stops: [
                        0.1,
                        0.5,
                        0.9
                      ],
                      colors: [
                        Color(0xFF024087),
                        Color(0xFF024087),
                        Color(0xFF024087)
                      ]),
                  shape: BoxShape.rectangle,
                ),
                child: Text(time[1],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16,
                    )),
              ),
              Container(
                padding: EdgeInsets.all(10),
                height: 40,
                width: 30,
                alignment: Alignment.center,
                child: Text(":",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      //fontSize: ScreenUtil.getInstance().setSp(8),
                    )),
              ),
              Container(
                padding: EdgeInsets.all(10),
                height: 40,
                width: 40,
                alignment: Alignment.center,
                decoration: new BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      stops: [
                        0.1,
                        0.5,
                        0.9
                      ],
                      colors: [
                        Color(0xFF024087),
                        Color(0xFF024087),
                        Color(0xFF024087)
                      ]),
                  shape: BoxShape.rectangle,
                ),
                child: Text(time[2],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16,
                    )),
              ),
            ],
          );
        },
      ),
    );
  }

  listSearch() {
    return List<Container>.generate(20, (index) {
      return Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(color: Color(0xFFdfdfdf)),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.search,
              color: Color(0xFFdfdfdf),
            ),
            Text(generateWordPairs().take(1).toString()),
          ],
        ),
      );
    });
  }
}

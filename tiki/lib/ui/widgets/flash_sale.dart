import 'package:flutter/material.dart';
import 'package:tiki/enums/view_state.dart';
import 'package:tiki/models/types.dart';
import 'package:tiki/scoped_models/tab_home_model.dart';
import 'package:tiki/ui/shared/flutter_screenutil.dart';
import 'package:tiki/ui/views/second_views/product_detail_page.dart';
import 'package:transparent_image/transparent_image.dart';

class FlashSale extends StatefulWidget {
  final TabHomeModel model;

  const FlashSale(this.model);

  @override
  _FlashSaleState createState() => _FlashSaleState();
}

class _FlashSaleState extends State<FlashSale> {
  int value = 0;

  Types types = Types();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 320, height: 568)..init(context);
    return Column(
      children: <Widget>[
        Container(
          height: ScreenUtil.getInstance().setHeight(40),
          child: buildFlashFilter(),
        ),
        Expanded(
          child: Container(
            child: [
              Tab1(widget.model),
              Tab1(widget.model),
              Tab1(widget.model),
              Tab1(widget.model),
              Tab1(widget.model),
              Tab1(widget.model),
            ].elementAt(value),
          ),
        ),
      ],
    );
  }

  buildFlashFilter() {
    return ListView(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      children: List.generate(types.getListFilter().length, (index) {
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: ChoiceChip(
            selectedColor: Colors.black,
            labelStyle:
                TextStyle(color: value == index ? Colors.white : Colors.black),
            label:
                Text(types.getListFilter()[index].toString().split('.').last),
            selected: value == index,
            onSelected: (selected) {
              setState(() {
                value = index;
              });
            },
          ),
        );
      }),
    );
  }
}

class Tab1 extends StatefulWidget {
  final TabHomeModel model;

  const Tab1(this.model);

  @override
  _Tab1State createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> {
  Types types = Types();

  @override
  Widget build(BuildContext context) {
    if (widget.model.state == ViewState.Busy) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else
      return ListView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        children: List.generate(widget.model.getData.bestseller.items.length,
            (index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProductDetailPage(widget.model)));
            },
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: FadeInImage.memoryNetwork(
                              image:
                                  'https://trungnguyen.izysync.com/pub/media/catalog/product${widget.model.getData.bestseller.items[index].mediaGalleryEntries[0].file}',
                              fit: BoxFit.contain,
                              placeholder: kTransparentImage,
                            ),
                            width: ScreenUtil.getInstance().setWidth(100),
                            height: ScreenUtil.getInstance().setHeight(100),
                          ),
                        ),
                        Container(
                          alignment: AlignmentDirectional.center,
                          width: ScreenUtil.getInstance().setWidth(30),
                          height: ScreenUtil.getInstance().setHeight(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Color(0xFFff424e),
                          ),
                          child: Text(
                            "-55%",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil.getInstance().setSp(10)),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                      '${widget.model.formatMoney(widget.model.getData.bestseller.items[index].price)} đ'),
                ),
                buildSoldBar(3, 8),
              ],
            ),
          );
        }),
      );
  }

  buildSoldBar(itemSold, itemSum) {
    var _height = ScreenUtil.getInstance().setHeight(15);
    var _width = ScreenUtil.getInstance().setWidth(100);
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Stack(
        children: <Widget>[
          Container(
            height: _height,
            width: _width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Color(0xFFffaaaf),
            ),
          ),
          AnimatedContainer(
            alignment: AlignmentDirectional.centerStart,
            duration: Duration(seconds: 5),
            height: _height,
            width: (itemSold / itemSum) * _width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Color(0xFFff424e),
            ),
          ),
          Container(
            alignment: AlignmentDirectional.centerStart,
            margin: EdgeInsets.fromLTRB(0, 2, 0, 0),
            child: Text(
              itemSold == 0 ? "  Vừa mở bán " : "  Đã bán $itemSold ",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: ScreenUtil.getInstance().setSp(14)),
            ),
          )
        ],
      ),
    );
  }
}

class Tab2 extends StatefulWidget {
  @override
  _Tab2State createState() => _Tab2State();
}

class _Tab2State extends State<Tab2> {
  @override
  Widget build(BuildContext context) {
    return Text("22");
  }
}

class Tab3 extends StatefulWidget {
  @override
  _Tab3State createState() => _Tab3State();
}

class _Tab3State extends State<Tab3> {
  @override
  Widget build(BuildContext context) {
    return Text("33");
  }
}

class Tab4 extends StatefulWidget {
  @override
  _Tab4State createState() => _Tab4State();
}

class _Tab4State extends State<Tab4> {
  @override
  Widget build(BuildContext context) {
    return Text("44");
  }
}

class Tab5 extends StatefulWidget {
  @override
  _Tab5State createState() => _Tab5State();
}

class _Tab5State extends State<Tab5> {
  @override
  Widget build(BuildContext context) {
    return Text("55");
  }
}

class Tab6 extends StatefulWidget {
  @override
  _Tab6State createState() => _Tab6State();
}

class _Tab6State extends State<Tab6> {
  @override
  Widget build(BuildContext context) {
    return Text("66");
  }
}

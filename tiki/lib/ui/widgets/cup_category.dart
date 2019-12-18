import 'package:flutter/material.dart';
import 'package:tiki/enums/view_state.dart';
import 'package:tiki/models/types.dart';
import 'package:tiki/scoped_models/tab_home_model.dart';
import 'package:tiki/ui/shared/flutter_screenutil.dart';
import 'package:random_string/random_string.dart';
import 'package:transparent_image/transparent_image.dart';

class CupCategory extends StatefulWidget {
  final String banner;
  final TabHomeModel model;

  const CupCategory( this.banner, this.model);

  @override
  _CupCategoryState createState() => _CupCategoryState();
}

class _CupCategoryState extends State<CupCategory> {
  int value = 0;

  Types types = Types();


  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 320, height: 568)..init(context);
    return Container(
      margin: EdgeInsets.fromLTRB(0, 2, 0, 2),
      height: ScreenUtil.getInstance().setHeight(500),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: Text(
                  widget.model.getData.cupOfCoffee.title,
                  style: TextStyle(
                      fontSize: ScreenUtil.getInstance().setSp(14),
                      fontWeight: FontWeight.bold),
                ),
                width: ScreenUtil.getInstance().setWidth(200),
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: ScreenUtil.getInstance().setHeight(120),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.banner),
                      fit: BoxFit.cover),
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(15))
              ),
            ),
          ),
          Container(
            height: ScreenUtil.getInstance().setHeight(40),
            child: buildFilter(),
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
          Divider(),
          Container(
            height: ScreenUtil.getInstance().setHeight(40),
            alignment: AlignmentDirectional.center,
            child: FlatButton(
                onPressed: () {},
                child: Text(
                  "XEM THÊM " + randomNumeric(5) + " SẢN PHẨM >",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: ScreenUtil.getInstance().setSp(14)),
                )),
          ),
        ],
      ),
    );
  }

  buildFilter() {
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

  const Tab1( this.model);
  @override
  _Tab1State createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> {
  Types types = Types();

  @override
  Widget build(BuildContext context) {

    if (widget.model.state == ViewState.Busy){
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    else return GridView.count(
      scrollDirection: Axis.horizontal,
      crossAxisCount: 2,
      physics: AlwaysScrollableScrollPhysics(),
      children: List.generate(widget.model.getData.cupOfCoffee.items.length,
              (index) {
            return Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    child: Container(
                      width: ScreenUtil.getInstance().setWidth(80),
                      height: ScreenUtil.getInstance().setHeight(80),
                      child: FadeInImage.memoryNetwork(
                        image: 'https://trungnguyen.izysync.com/pub/media/catalog/product${widget.model.getData.cupOfCoffee.items[index].mediaGalleryEntries[0].file}',
                        fit: BoxFit.contain,
                        placeholder: kTransparentImage,
                      ),
                    ),
                    onTap: () {
                      print(MediaQuery.of(context).size.height);
                    },
                  ),
                  Container(
                    width: ScreenUtil.getInstance().setWidth(80),
                    alignment: AlignmentDirectional.center,
                    child: Text(
                      '${widget.model.getData.cupOfCoffee.items[index].name}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    width: ScreenUtil.getInstance().setWidth(80),
                    alignment: AlignmentDirectional.center,
                    child: Text(
                      '${widget.model.getData.cupOfCoffee.items[index].price} đ',
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
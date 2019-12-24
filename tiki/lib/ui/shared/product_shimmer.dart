import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'flutter_screenutil.dart';

class ProductShimmer extends StatefulWidget {
  @override
  ProductShimmerState createState() => ProductShimmerState();
}

class ProductShimmerState extends State<ProductShimmer> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 320, height: 568)..init(context);
    return Container(
      margin: EdgeInsets.fromLTRB(0, 2, 0, 2),
      height: ScreenUtil.getInstance().setHeight(300),
      color: Colors.white,
      child: Shimmer.fromColors(
          child: Column(
            children: <Widget>[
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Container(
                  height: ScreenUtil.getInstance().setHeight(16),
                  margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                  width: ScreenUtil.getInstance().setWidth(200),
                  color: Colors.grey[300],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: ScreenUtil.getInstance().setHeight(120),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  buildProduct(),
                  buildProduct(),
                  buildProduct()
                ],
              ),
              Divider(),
            ],
          ),
          baseColor: Colors.grey[300],
          highlightColor: Colors.white60),
    );
  }

  static buildProduct() {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              width: ScreenUtil.getInstance().setWidth(80),
              height: ScreenUtil.getInstance().setHeight(80),
              color: Colors.grey[300],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              width: ScreenUtil.getInstance().setWidth(80),
              height: ScreenUtil.getInstance().setHeight(16),
              alignment: AlignmentDirectional.center,
              color: Colors.grey[300],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Container(
              width: ScreenUtil.getInstance().setWidth(80),
              height: ScreenUtil.getInstance().setHeight(12),
              alignment: AlignmentDirectional.center,
              color: Colors.grey[300],
            ),
          ),
        ],
      ),
    );
  }
}

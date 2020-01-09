import 'package:date_format/date_format.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:now_partner/enums/view_state.dart';
import 'package:now_partner/scoped_models/home_view_model.dart';
import 'package:now_partner/ui/shared/flutter_screenutil.dart';
import 'package:now_partner/ui/shared/cus_dialog.dart' as customDialog;
import 'package:slider_button/slider_button.dart';

import 'tab3.dart';
import 'tab4.dart';

class Tab1 extends StatelessWidget {
  final HomeViewModel model;

  const Tab1(this.model);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 320, height: 568)..init(context);
    void _showDialog() {
      // flutter defined function
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return customDialog.Dialog(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Text(
                    "Check - in hôm nay",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil.getInstance().setSp(14),
                    ),
                  ),
                  alignment: AlignmentDirectional.center,
                ),
                Container(
                  child: Text(
                    formatDate(DateTime.now(), [dd, '/', mm, '/', yyyy]),
                    style: TextStyle(
                      fontSize: ScreenUtil.getInstance().setSp(14),
                    ),
                  ),
                  alignment: AlignmentDirectional.center,
                ),
                ListTile(
                  leading: Text(
                    "Đăng ký: ",
                    style: TextStyle(
                      fontSize: ScreenUtil.getInstance().setSp(14),
                      color: Colors.grey,
                    ),
                  ),
                  title: Text(
                    "Full time 0h00 - 23h59",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil.getInstance().setSp(14),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Text(
                        "Bắt đầu",
                        style: TextStyle(
                          fontSize: ScreenUtil.getInstance().setSp(14),
                          color: Colors.grey,
                        ),
                      ),
                      margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
                    ),
                    Container(
                      child: Text(
                        "Kết thúc",
                        style: TextStyle(
                            fontSize: ScreenUtil.getInstance().setSp(14),
                            color: Colors.grey),
                      ),
                      margin: EdgeInsets.all(10),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Text(
                        "Hiện tại",
                        style: TextStyle(
                          fontSize: ScreenUtil.getInstance().setSp(14),
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      margin: EdgeInsets.all(5),
                    ),
                    Container(
                      height: 1,
                      color: Colors.grey,
                      width: ScreenUtil.getInstance().setWidth(150),
                    ),
                    Clock24Example(),
                  ],
                ),
                Container(
                  child: Text(
                    "Vị trí hiện tại của bạn: ",
                    style: TextStyle(
                        fontSize: ScreenUtil.getInstance().setSp(14),
                        color: Colors.grey),
                  ),
                  margin: EdgeInsets.fromLTRB(0, 15, 0, 5),
                  alignment: AlignmentDirectional.center,
                ),
                Container(
                  child: Text(
                    "500 Xã Đàn, Nam Đồng, Đống Đa, Hà Nội, Vietnam",
                    style: TextStyle(
                      fontSize: ScreenUtil.getInstance().setSp(14),
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                  margin: EdgeInsets.fromLTRB(5, 10, 5, 5),
                  alignment: AlignmentDirectional.center,
                ),
                Container(
                  child: Text(
                    "Lat: " +
                        model.location.lat.toString() +
                        "; Lon: " +
                        model.location.lon.toString(),
                    style: TextStyle(
                      fontSize: ScreenUtil.getInstance().setSp(12),
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                  ),
                  margin: EdgeInsets.fromLTRB(5, 10, 5, 5),
                  alignment: AlignmentDirectional.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        color: Colors.grey,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Thoát",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: ScreenUtil.getInstance().setSp(14),
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        color: Colors.blue,
                        onPressed: () {},
                        child: Text(
                          "Check - in",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: ScreenUtil.getInstance().setSp(12),
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      );
    }

    var tabController = new DefaultTabController(
        length: 3,
        child: new Scaffold(
          appBar: new AppBar(
            title: new TabBar(
              labelPadding: EdgeInsets.all(2),
              tabs: [
                Tab(
                  text: "FREE-PICK",
                ),
                Tab(
                  text: "ĐANG LÀM",
                ),
                Tab(
                  text: "ĐÃ XONG",
                ),
              ],
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
            ),
            actions: <Widget>[
              FlatButton(
                  padding: EdgeInsets.all(0),
                  color: Colors.red,
                  onPressed: _showDialog,
                  child: Icon(
                    Icons.power_settings_new,
                    color: Colors.white,
                  )),
            ],
          ),
          body: TabBarView(
            children: [
              model.state == ViewState.Busy
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : TabFreePick(model),
              Tab3(),
              Tab4(),
            ],
            physics: NeverScrollableScrollPhysics(),
          ),
        ));
    return tabController;
  }
}

class TabFreePick extends StatefulWidget {
  final HomeViewModel model;

  const TabFreePick(this.model);

  @override
  _TabFreePickState createState() => _TabFreePickState();
}

class _TabFreePickState extends State<TabFreePick> {
  final Map<String, Marker> markers = <String, Marker>{};
  Map<PolylineId, Polyline> _mapPolylines = <PolylineId, Polyline>{};
  int _polylineIdCounter = 1;
  GoogleMapController _mapController;

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      child: Stack(
        children: <Widget>[
          GoogleMap(
              onMapCreated: (GoogleMapController controller) {
                _mapController = controller;
              },
              markers: Set<Marker>.of(markers.values),
              polylines: Set<Polyline>.of(_mapPolylines.values),
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: LatLng(21.0177511, 105.83147519999999),
                zoom: 15,
              )),
        ],
      ),
    );
  }

  void _getLocation() {
    setState(() {
      markers.clear();
      final marker = Marker(
        markerId: MarkerId("curr_loc"),
        position: LatLng(widget.model.location.lat, widget.model.location.lon),
        infoWindow: InfoWindow(
            title: 'Your Location ' +
                "Lat: " +
                widget.model.location.lat.toString() +
                "; Lon: " +
                widget.model.location.lon.toString()),
      );
      final marker2 = Marker(
        onTap: showOrderAuto,
        markerId: MarkerId("don_hang_1"),
        position: LatLng(21.019358, 105.832817),
        infoWindow: InfoWindow(title: 'Don hang 1'),
      );
      final marker3 = Marker(
      onTap: showOrderSelect,
      markerId: MarkerId("don_hang_2"),
      position: LatLng(21.016364, 105.829983),
      infoWindow: InfoWindow(title: 'Don hang tu chon 1'),
      );
      markers["Current Location"] = marker;
      markers["Don hang tu dong"] = marker2;
      markers["Don hang tu chon"] = marker3;
    });
  }

  showOrderSelect(){
    showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 300,
            color: Colors.white,
            margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
            child: Column(
              children: <Widget>[
                Container(
                  child: Text("Delivery "),
                  alignment: AlignmentDirectional.topStart,
                ),
                Row(
                  children: <Widget>[

                  ],
                ),
              ],
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim1),
          child: child,
        );
      },
    );
  }

  showOrderAuto() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return customDialog.Dialog(
            backgroundColor: Colors.transparent,
            child: Column(
              children: <Widget>[
                Container(
                  alignment: AlignmentDirectional.bottomCenter,
                  height: ScreenUtil.getInstance().setHeight(100),
                  child: Text(
                    "Ship",
                    style: TextStyle(
                      fontSize: ScreenUtil.getInstance().setSp(18),
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(
                          "Gửi - Quán A Tũn",
                          style: TextStyle(
                              fontSize: ScreenUtil.getInstance().setSp(13),
                              color: Colors.grey),
                        ),
                        margin: EdgeInsets.fromLTRB(20, 5, 5, 5),
                        alignment: AlignmentDirectional.topStart,
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 5, 5, 5),
                        child: Text(
                          "Đối diện lô F1 khu đô thị, P. Nguyễn Cảnh Dị, Đại Từ, Hoàng Mai, Hà Nội, Vietnam",
                          style: TextStyle(
                              fontSize: ScreenUtil.getInstance().setSp(14),
                              color: Colors.black),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: ScreenUtil.getInstance().setWidth(75),
                            height: ScreenUtil.getInstance().setHeight(30),
                            alignment: AlignmentDirectional.center,
                            margin: EdgeInsets.fromLTRB(25, 5, 5, 5),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: Colors.grey,
                              ),
                            ),
                            child: RichText(
                              text: TextSpan(
                                  text: "Nhận: ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          ScreenUtil.getInstance().setSp(13)),
                                  children: [
                                    TextSpan(
                                        text: "10:59",
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                            fontSize: ScreenUtil.getInstance()
                                                .setSp(13)))
                                  ]),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: ScreenUtil.getInstance().setWidth(125),
                            margin: EdgeInsets.fromLTRB(25, 5, 5, 5),
                            child: RichText(
                              text: TextSpan(
                                  text: "Trả quán: ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          ScreenUtil.getInstance().setSp(13)),
                                  children: [
                                    TextSpan(
                                        text: "10.000 đ",
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                            fontSize: ScreenUtil.getInstance()
                                                .setSp(13)))
                                  ]),
                            ),
                          ),
                          Container(
                            width: ScreenUtil.getInstance().setWidth(75),
                            height: ScreenUtil.getInstance().setHeight(30),
                            child: Image.asset(
                              "images/air-pay.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        child: Text(
                          "Nhận - A Tùng",
                          style: TextStyle(
                              fontSize: ScreenUtil.getInstance().setSp(13),
                              color: Colors.grey),
                        ),
                        margin: EdgeInsets.fromLTRB(20, 5, 5, 5),
                        alignment: AlignmentDirectional.topStart,
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 5, 5, 5),
                        child: Text(
                          "1277 Giải Phóng, Thịnh Liệt, Hoàng Mai, Hà Nội, Vietnam",
                          style: TextStyle(
                              fontSize: ScreenUtil.getInstance().setSp(14),
                              color: Colors.black),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: ScreenUtil.getInstance().setWidth(150),
                            margin: EdgeInsets.fromLTRB(25, 5, 5, 5),
                            child: RichText(
                              text: TextSpan(
                                  text: "Trả người nhận: ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          ScreenUtil.getInstance().setSp(13)),
                                  children: [
                                    TextSpan(
                                        text: "30.000 đ",
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                            fontSize: ScreenUtil.getInstance()
                                                .setSp(13)))
                                  ]),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            color: Colors.grey[400],
                            width: ScreenUtil.getInstance().setWidth(110),
                            height: ScreenUtil.getInstance().setHeight(30),
                            margin: EdgeInsets.fromLTRB(25, 5, 5, 5),
                            alignment: AlignmentDirectional.center,
                            child: RichText(
                              text: TextSpan(
                                  text: "4.5km - Phí: ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          ScreenUtil.getInstance().setSp(13)),
                                  children: [
                                    TextSpan(
                                        text: "18k",
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                            fontSize: ScreenUtil.getInstance()
                                                .setSp(13)))
                                  ]),
                            ),
                          ),
                          Container(
                            width: ScreenUtil.getInstance().setWidth(75),
                            height: ScreenUtil.getInstance().setHeight(30),
                            margin: EdgeInsets.fromLTRB(25, 5, 5, 5),
                            alignment: AlignmentDirectional.center,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: Colors.grey,
                              ),
                            ),
                            child: RichText(
                              text: TextSpan(
                                  text: "Nhận: ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          ScreenUtil.getInstance().setSp(13)),
                                  children: [
                                    TextSpan(
                                        text: "10:59",
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                            fontSize: ScreenUtil.getInstance()
                                                .setSp(13)))
                                  ]),
                            ),
                          ),
                          Container(
                            color: Colors.red,
                            height: ScreenUtil.getInstance().setHeight(30),
                            width: ScreenUtil.getInstance().setWidth(50),
                            alignment: AlignmentDirectional.center,
                            margin: EdgeInsets.fromLTRB(25, 5, 5, 5),
                            child: Text(
                              "34'",
                              style: TextStyle(
                                  fontSize: ScreenUtil.getInstance().setSp(16),
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                  ),
                ),
                Container(

                  child: SliderButton(
                    action: () {
                      ///Do something here OnSlide
                      print("Nhan don");
                      Navigator.pop(context);
                    },

                    ///Put label over here
                    label: Text(
                      "Nhận đơn",
                      style: TextStyle(
                          color: Color(0xff4a4a4a),
                          fontWeight: FontWeight.w500,
                          fontSize: ScreenUtil.getInstance().setSp(16)),
                    ),
                    icon: Center(
                        child: Icon(
                          Icons.navigate_next,
                          color: Colors.black,
                          size: 40.0,
                          semanticLabel: 'Text to announce in accessibility modes',
                        )),

                    ///Change All the color and size from here.
                    radius: 10,
                    buttonColor: Colors.white,
                    backgroundColor: Colors.blue[800],
                    highlightedColor: Colors.white,
                    baseColor: Colors.red,
                    width: 300,
                  ),
                )
              ],
            ),
          );
        });
  }
}

class Clock24Example extends StatelessWidget {
  final format = DateFormat("HH:mm");

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 320, height: 568)..init(context);
    return Column(children: <Widget>[
      Container(
        width: 95,
        margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
        child: DateTimeField(
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: ScreenUtil.getInstance().setSp(14)),
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            fillColor: Colors.red,
            filled: true,
          ),
          format: format,
          resetIcon: null,
          readOnly: true,
          onShowPicker: (context, currentValue) async {
            final time = await showTimePicker(
              context: context,
              initialTime:
                  TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
              builder: (context, child) => MediaQuery(
                  data: MediaQuery.of(context)
                      .copyWith(alwaysUse24HourFormat: true),
                  child: child),
            );
            return DateTimeField.convert(time);
          },
        ),
      ),
    ]);
  }
}

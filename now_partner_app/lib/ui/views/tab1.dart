import 'package:date_format/date_format.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:now_partner/enums/view_state.dart';
import 'package:now_partner/scoped_models/home_view_model.dart';
import 'package:now_partner/ui/shared/flutter_screenutil.dart';

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
          return Dialog(
            child: Container(
              height: ScreenUtil.getInstance().setHeight(300),
              child: Column(
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
                        height: 1.5,
                        color: Colors.black,
                        width: ScreenUtil.getInstance().setWidth(100),
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
      markers["Current Location"] = marker;
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

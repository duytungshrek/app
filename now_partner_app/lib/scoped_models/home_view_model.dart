import 'package:now_partner/models/location.dart';
import 'package:now_partner/services/home_view_services.dart';

import 'base_model.dart';
class HomeViewModel extends BaseModel {
  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
  Location location;

  Location get getData => location;
  HomeViewServices homeViewServices = HomeViewServices();

  // ignore: missing_return
  Future<HomeViewServices> getLocation() async {
    setState(ViewState.Busy);
    print("Getting....");
    location = await homeViewServices.getLocation();
    print("Success");
    setState(ViewState.Retrieved);
  }
}
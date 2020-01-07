import 'package:geolocator/geolocator.dart';
import 'package:now_partner/models/location.dart';

class HomeViewServices {
  Future<Location> getLocation() async {
    var currentLocation = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    return Location(currentLocation.latitude, currentLocation.longitude);
  }
}
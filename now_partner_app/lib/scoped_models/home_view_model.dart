import 'base_model.dart';
class HomeViewModel extends BaseModel {
  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
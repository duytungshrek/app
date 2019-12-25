import 'package:intl/intl.dart';
import 'package:tiki/enums/view_state.dart';
import 'package:tiki/models/home_product.dart';
import 'package:tiki/scoped_models/base_model.dart';
import 'package:tiki/services/tab_home_service.dart';

class TabHomeModel extends BaseModel {
  HomeProduct product;

  HomeProduct get getData => product;
  TabHomeService tabHomeService = TabHomeService();

  // ignore: missing_return
  Future<TabHomeService> fetchHomeProductData() async {
    setState(ViewState.Busy);
    print("Fetching....");
    product = await tabHomeService.fetchHomeProductData();
    print("Success");
    setState(ViewState.Retrieved);
  }

  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void notify() {
    notifyListeners();
  }

  String formatMoney(double money) {
    if(money!=null){
      final formatCurrency = new NumberFormat("#,###", "vi").format(money);
      return formatCurrency.toString();

    }else{
      return "0.0";
    }
  }


}

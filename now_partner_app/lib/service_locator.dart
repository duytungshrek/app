import 'package:get_it/get_it.dart';
import 'package:now_partner/scoped_models/home_view_model.dart';
import 'package:now_partner/services/home_view_services.dart';

GetIt locator = new GetIt();

void setupLocator() {
  // Register services
  locator.registerLazySingleton<HomeViewServices>(() => HomeViewServices());
  // Register ScopedModels
  locator.registerFactory<HomeViewModel>(() => HomeViewModel());
}


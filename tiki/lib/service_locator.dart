import 'package:get_it/get_it.dart';
import 'package:tiki/scoped_models/home_view_model.dart';
import 'package:tiki/scoped_models/tab_home_model.dart';
import 'package:tiki/services/tab_home_service.dart';

GetIt locator = new GetIt();

void setupLocator() {
  // Register services
  locator.registerLazySingleton<TabHomeService>(() => TabHomeService());
  // Register ScopedModels
  locator.registerFactory<HomeViewModel>(() => HomeViewModel());
  locator.registerFactory<TabHomeModel>(() => TabHomeModel());
}

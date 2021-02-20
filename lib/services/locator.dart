import 'package:get_it/get_it.dart';
import 'locator.config.dart';
import 'package:injectable/injectable.dart';
//import 'package:stacked_services/stacked_services.dart';

final locator = GetIt.instance;

@injectableInit
void setupLoactor() => $initGetIt(locator);
//locator.registerLazySingleton(() => NavigationService(locator))

/*import 'package:get_it/get_it.dart';
//import 'package:compound/services/navigation_service.dart';
//import 'package:compound/services/dialog_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => AuthenticationService());
}*/

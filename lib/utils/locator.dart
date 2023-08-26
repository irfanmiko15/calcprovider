import '../service/connection_service.dart';
import '../service/localization_service.dart';
import '../service/location_service.dart';
import '../service/navigation_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;
void setupLocator() {
 
  locator.registerLazySingleton(() => LocationService());
  locator.registerLazySingleton(() => NavigationService());
  // locator.registerLazySingleton(() => NotificationService());
  locator.registerLazySingleton(() => LocalizationService());
  locator.registerLazySingleton(() => ConnectionService());

}

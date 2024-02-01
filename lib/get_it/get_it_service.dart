import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fruit/local_notification_center.dart';
import 'package:fruit/service/dynamic_link_service/dynamic_link_service.dart';
import 'package:fruit/service/email_store/email_store.dart';
import 'package:fruit/service/firebase_auth/firebase_auth_store.dart';
import 'package:fruit/shared_model/app_environment_model.dart';
import 'package:fruit/shared_model/cart_items_model.dart';
import 'package:fruit/shared_model/track_items_model.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

class GetItService {
  static Future<void> initialize() async {
    getIt.registerLazySingleton<AppUserEnvironmentModel>(
        () => AppUserEnvironmentModel());
    getIt.registerLazySingleton<TrackItemsModol>(() => TrackItemsModol());
    getIt.registerLazySingleton<CartItemsModel>(() => CartItemsModel());

    getIt.registerLazySingleton<FirebaseAuthStroe>(() => FirebaseAuthStroe());

    getIt.registerLazySingleton<EmailSecureStore>(() => EmailSecureStore());

    getIt.registerLazySingleton<FlutterSecureStorage>(
        () => const FlutterSecureStorage());

    getIt.registerLazySingleton<DynamicLinkService>(() => DynamicLinkService());

    getIt.registerLazySingleton<LocalNotificationCenter>(
        () => LocalNotificationCenter());
  }
}

part of 'configuration.dart';

GetIt sl = GetIt.instance;
Future<void> initialize() async {
  sl.registerFactory(() => SplashCubit());
}

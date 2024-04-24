

import 'package:get_it/get_it.dart';
import 'package:yon_test/core/view_models/video_player_model.dart';
import '../../ui/shared/utils/theme.dart';
import '../view_models/yon_test_model.dart';
import 'fake_api/yon_test_api_fake.dart';

final locator = GetIt.instance;

void setupLocator() {

  // Singleton Services
  locator.registerLazySingleton<YonTestTheme>(()=>YonTestTheme());
  locator.registerLazySingleton<YonTestApiFake>(()=>YonTestApiFake());



  // Singleton ViewModels
  locator.registerLazySingleton<YonTestModel>(()=>YonTestModel());

  locator.registerFactory<VideoPlayerModel>(() => VideoPlayerModel());






}

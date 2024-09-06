import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:network/network.dart';

import '../app_config.dart';

final sl = GetIt.instance;

Future<void> init(AppConfig appConfig) async {
  sl
    ..registerSingleton(Dio())
    ..registerSingleton(GeneralService(sl(), baseUrl: appConfig.baseUrl));
}

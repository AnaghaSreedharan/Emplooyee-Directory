import 'package:dio/dio.dart';
import 'ApiConfigs.dart';

BaseOptions options = BaseOptions(
  baseUrl: ApiConfigs.API_URL,
    headers: {'Content-Type': 'application/json' }
);
Dio dioInstance = Dio(options);
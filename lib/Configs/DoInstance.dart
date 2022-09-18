import 'package:dio/dio.dart';
import 'ApiConfigs.dart';

BaseOptions options = new BaseOptions(
  baseUrl: ApiConfigs.API_URL,
    headers: {'Content-Type': 'application/json' }
  // connectTimeout: 5000,
  // receiveTimeout: 3000,
);
Dio dioInstance = new Dio(options);
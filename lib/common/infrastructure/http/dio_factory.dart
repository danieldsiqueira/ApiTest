import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Dio dioFactory() {
  var dio = Dio(BaseOptions(baseUrl: dotenv.env['baseUrl']!));
  return dio;
}

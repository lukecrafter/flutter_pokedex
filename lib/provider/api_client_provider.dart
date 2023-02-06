import 'package:dio/dio.dart';
import 'package:flutter_pokedex/service/api_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_client_provider.g.dart';

@riverpod
Dio apiClient(ApiClientRef ref) => ApiClient().dio;

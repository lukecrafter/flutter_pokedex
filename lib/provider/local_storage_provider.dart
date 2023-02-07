import 'package:flutter_pokedex/service/local_storage_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_storage_provider.g.dart';

@Riverpod(keepAlive: true)
LocalStorageService storageService(StorageServiceRef ref) =>
    LocalStorageService();

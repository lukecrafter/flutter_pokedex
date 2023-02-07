import 'package:flutter_pokedex/feature/home/notifier/home_notifier.dart';
import 'package:flutter_pokedex/feature/home/repository/home_repository.dart';
import 'package:flutter_pokedex/feature/home/service/home_service.dart';
import 'package:flutter_pokedex/provider/api_client_provider.dart';
import 'package:flutter_pokedex/provider/local_storage_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_provider.g.dart';

@riverpod
HomeRepository homeRepository(HomeRepositoryRef ref) => HomeRepository(
      ref.watch(homeServicesProvider),
    );

@riverpod
HomeServicesImpl homeServices(HomeServicesRef ref) => HomeServicesImpl(
      ref.watch(apiClientProvider),
    );

@Riverpod(keepAlive: true)
HomeNotifier homeNotifier(HomeNotifierRef ref) => HomeNotifier(
      homeRepositoryProvider: ref.read(homeRepositoryProvider),
      storageService: ref.watch(storageServiceProvider),
    );

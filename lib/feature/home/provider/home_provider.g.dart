// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String _$homeRepositoryHash() => r'ab4788255718585a577c87de839e89d591650cf7';

/// See also [homeRepository].
final homeRepositoryProvider = AutoDisposeProvider<HomeRepository>(
  homeRepository,
  name: r'homeRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$homeRepositoryHash,
);
typedef HomeRepositoryRef = AutoDisposeProviderRef<HomeRepository>;
String _$homeServicesHash() => r'5fe54064c2c555959fa95c45020eaadcd056c541';

/// See also [homeServices].
final homeServicesProvider = AutoDisposeProvider<HomeServicesImpl>(
  homeServices,
  name: r'homeServicesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$homeServicesHash,
);
typedef HomeServicesRef = AutoDisposeProviderRef<HomeServicesImpl>;
String _$homeNotifierHash() => r'a75912f039e62b4a38397b220f5a30ad05c22bd0';

/// See also [homeNotifier].
final homeNotifierProvider = Provider<HomeNotifier>(
  homeNotifier,
  name: r'homeNotifierProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$homeNotifierHash,
);
typedef HomeNotifierRef = ProviderRef<HomeNotifier>;

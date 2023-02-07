import 'package:flutter_pokedex/feature/pokemon/repository/pokemon_repository.dart';
import 'package:flutter_pokedex/feature/pokemon/service/pokemon_service.dart';
import 'package:flutter_pokedex/provider/api_client_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_provider.g.dart';

@riverpod
PokemonRepository pokemonRepository(PokemonRepositoryRef ref) =>
    PokemonRepository(
      ref.watch(pokemonServicesProvider),
    );

@riverpod
PokemonServiceImpl pokemonServices(PokemonServicesRef ref) =>
    PokemonServiceImpl(
      ref.watch(apiClientProvider),
    );

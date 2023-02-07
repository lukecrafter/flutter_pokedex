import 'package:flutter_pokedex/feature/home/model/pokemon_response.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

class LocalStorageService {
  factory LocalStorageService() => LocalStorageService._internal();

  LocalStorageService._internal() {
    init();
  }

  late FlutterSecureStorage _storage;

  Future<void> init() async {
    _storage = const FlutterSecureStorage();
  }

  Future<String?> getPokemon(String id) async {
    return _storage.read(key: id);
  }

  Future<void> setPokemon(String id, PokemonResponse value) async {
    final String storedValue = json.encode(value.toJson());
    await _storage.write(key: id, value: storedValue);
  }

  Future<List<PokemonResponse>> getAllPokemon() async {
    final Map<String, String> storedData = await _storage.readAll();

    List<PokemonResponse> pokemonList = [];
    storedData.forEach((String key, String value) {
      pokemonList.add(
        PokemonResponse.fromJson(
          json.decode(value),
        ),
      );
    });
    pokemonList.sort((PokemonResponse a, PokemonResponse b) {
      return a.id?.compareTo(b.id ?? 0) ?? 0;
    });
    return pokemonList;
  }

  Future<void> setPokemonList(List<PokemonResponse> pokemonList) async {
    for (PokemonResponse pokemon in pokemonList) {
      if (pokemon.id == null) continue;
      await setPokemon(pokemon.id.toString(), pokemon);
    }
  }

  Future<bool> isPokemonInStorage(String id) async {
    final String? value = await _storage.read(key: id);
    return value != null;
  }

  Future<void> deletePokemon(String id) async {
    await _storage.delete(key: id);
  }

  Future<void> deleteAllPokemon() async {
    await _storage.deleteAll();
  }
}

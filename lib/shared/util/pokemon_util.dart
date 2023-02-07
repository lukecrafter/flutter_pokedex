import 'package:flutter_pokedex/shared/enum/pokemon_type_enum.dart';

PokemonTypes getPokemonTypes(String type) {
  return PokemonTypes.values.firstWhere(
    (PokemonTypes e) => e.toString().split('.').last == type,
    orElse: () => PokemonTypes.unknown,
  );
}

String getPokemonOfficialImageUrl(String id) {
  return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png';
}

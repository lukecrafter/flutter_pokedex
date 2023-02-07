import 'package:flutter_pokedex/feature/home/model/pokemon_response.dart';
import 'package:flutter_pokedex/feature/pokemon/model/pokemon_stat.dart';
import 'package:flutter_pokedex/shared/enum/pokemon_type_enum.dart';

extension PokemonResponseExtension on PokemonResponse {
  PokemonTypes getMainType() {
    return types?.first.type?.pokemonTypes ?? PokemonTypes.unknown;
  }

  String get imageUrl {
    return sprites?.other?.officialArtwork?.frontDefault ?? '';
  }

  List<PokemonStat> get getPokemonStats {
    return stats?.map((Stats e) => PokemonStat.fromResponseStats(e)).toList() ??
        [];
  }
}

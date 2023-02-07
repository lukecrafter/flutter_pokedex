import 'package:flutter_pokedex/feature/home/model/pokemon_response.dart';

class PokemonStat {
  final int baseStat;
  final String name;

  PokemonStat({
    required this.baseStat,
    required this.name,
  });

  factory PokemonStat.fromResponseStats(Stats stats) {
    return PokemonStat(
      baseStat: stats.baseStat ?? 0,
      name: stats.stat?.name ?? '',
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_pokedex/feature/home/model/pokemon_response.dart';
import 'package:flutter_pokedex/feature/pokemon/model/pokemon_stat.dart';
import 'package:flutter_pokedex/feature/pokemon/presentation/widget/pokemon_data_stat.dart';
import 'package:flutter_pokedex/shared/app_colors.dart';
import 'package:flutter_pokedex/shared/enum/pokemon_type_enum.dart';
import 'package:flutter_pokedex/shared/extension/pokemon_response_extension.dart';
import 'package:flutter_pokedex/shared/extension/string_extension.dart';

class PokemonDataStatBoard extends StatelessWidget {
  final PokemonResponse pokemon;

  const PokemonDataStatBoard({
    super.key,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    final List<PokemonStat> stats = pokemon.getPokemonStats;

    return Padding(
      padding: const EdgeInsets.only(top: 10.0, right: 30.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.grey.withOpacity(0.6),
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            for (final PokemonStat stat in stats) ...[
              PokemonDataStat(
                label: stat.name.firstLetterToUpperCase(),
                color: pokemon.getMainType().color,
                value: stat.baseStat,
              ),
              if (stat != stats.last)
                const SizedBox(
                  height: 5.0,
                )
            ],
          ],
        ),
      ),
    );
  }
}

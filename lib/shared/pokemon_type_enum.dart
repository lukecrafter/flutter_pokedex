import 'dart:ui';

import 'package:flutter_pokedex/shared/app_colors.dart';

enum PokemonTypes {
  grass,
  poison,
  fire,
  flying,
  water,
  bug,
  normal,
  electric,
  ground,
  fairy,
  fighting,
  psychic,
  rock,
  steel,
  ice,
  ghost,
  dragon,
  dark,
  monster,
  unknown,
}

// create extensions for the enum to get the type by string
extension PokemonTypesExtension on PokemonTypes {
  static PokemonTypes fromString(String type) {
    return PokemonTypes.values.firstWhere(
      (PokemonTypes e) => e.toString().split('.').last == type,
      orElse: () => PokemonTypes.unknown,
    );
  }

  String get name => toString().split('.').last;

  Color get color {
    switch (this) {
      case PokemonTypes.grass:
        return AppColors.lightGreen;

      case PokemonTypes.bug:
        return AppColors.lightTeal;

      case PokemonTypes.fire:
        return AppColors.lightRed;

      case PokemonTypes.water:
        return AppColors.lightBlue;

      case PokemonTypes.fighting:
        return AppColors.red;

      case PokemonTypes.normal:
        return AppColors.beige;

      case PokemonTypes.electric:
        return AppColors.lightYellow;

      case PokemonTypes.psychic:
        return AppColors.lightPink;

      case PokemonTypes.poison:
        return AppColors.lightPurple;

      case PokemonTypes.ghost:
        return AppColors.purple;

      case PokemonTypes.ground:
        return AppColors.darkBrown;

      case PokemonTypes.rock:
        return AppColors.lightBrown;

      case PokemonTypes.dark:
        return AppColors.black;

      case PokemonTypes.dragon:
        return AppColors.violet;

      case PokemonTypes.fairy:
        return AppColors.pink;

      case PokemonTypes.flying:
        return AppColors.lilac;

      case PokemonTypes.ice:
        return AppColors.lightCyan;

      case PokemonTypes.steel:
        return AppColors.grey;

      default:
        return AppColors.lightBlue;
    }
  }
}

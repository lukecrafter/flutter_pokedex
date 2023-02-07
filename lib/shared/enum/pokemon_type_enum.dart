import 'package:flutter/material.dart';
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

extension PokemonTypesExtension on PokemonTypes {
  String get name => toString().split('.').last;

  Color iconColor() {
    switch (this) {
      case PokemonTypes.bug:
        return const Color(0xff92BC2C);
      case PokemonTypes.dark:
        return const Color(0xff595761);
      case PokemonTypes.dragon:
        return const Color(0xff0C69C8);
      case PokemonTypes.electric:
        return const Color(0xffF2D94E);
      case PokemonTypes.fire:
        return const Color(0xffFBA54C);
      case PokemonTypes.fairy:
        return const Color(0xffEE90E6);
      case PokemonTypes.fighting:
        return const Color(0xffD3425F);
      case PokemonTypes.flying:
        return const Color(0xffA1BBEC);
      case PokemonTypes.ghost:
        return const Color(0xff5F6DBC);
      case PokemonTypes.grass:
        return const Color(0xff5FBD58);
      case PokemonTypes.ground:
        return const Color(0xffDA7C4D);
      case PokemonTypes.ice:
        return const Color(0xff75D0C1);
      case PokemonTypes.normal:
        return const Color(0xffA0A29F);
      case PokemonTypes.poison:
        return const Color(0xffB763CF);
      case PokemonTypes.psychic:
        return const Color(0xffFA8581);
      case PokemonTypes.rock:
        return const Color(0xffC9BB8A);
      case PokemonTypes.steel:
        return const Color(0xff5695A3);
      case PokemonTypes.water:
        return const Color(0xff539DDF);
      case PokemonTypes.monster:
        return Colors.grey.shade200;
      case PokemonTypes.unknown:
      default:
        return Colors.black;
    }
  }

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

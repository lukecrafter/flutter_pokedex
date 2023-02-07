import 'package:flutter/material.dart';
import 'package:flutter_pokedex/feature/pokemon/presentation/widget/progress_bar.dart';

class PokemonDataStat extends StatelessWidget {
  final String label;
  final Color color;
  final num value;

  const PokemonDataStat({
    super.key,
    required this.value,
    required this.color,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    const int upperLimit = 255;
    final double progress = value / upperLimit;

    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        Expanded(
          child: Text(
            '$value',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        Expanded(
          flex: 5,
          child: ProgressBar(
            progress: progress,
            color: color,
          ),
        )
      ],
    );
  }
}

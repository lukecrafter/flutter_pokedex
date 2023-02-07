import 'package:flutter/material.dart';

class PokemonDataBasicDetail extends StatelessWidget {
  final String height;
  final String weight;
  const PokemonDataBasicDetail({
    super.key,
    required this.height,
    required this.weight,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RichText(
          textDirection: TextDirection.ltr,
          text: TextSpan(
            text: 'Height: ',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
            children: <TextSpan>[
              TextSpan(
                text: '${height}m',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 20.0),
        RichText(
          textDirection: TextDirection.ltr,
          text: TextSpan(
            text: 'Weight: ',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
            children: <TextSpan>[
              TextSpan(
                text: '${weight}kg',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

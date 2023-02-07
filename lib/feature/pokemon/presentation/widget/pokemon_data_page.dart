import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_pokedex/feature/home/model/pokemon_response.dart';
import 'package:flutter_pokedex/shared/enum/pokemon_type_enum.dart';
import 'package:flutter_pokedex/shared/util/pokemon_util.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PokemonDataPage extends ConsumerStatefulWidget {
  final String id;
  final PokemonResponse pokemon;

  const PokemonDataPage({
    super.key,
    required this.id,
    required this.pokemon,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PokemonDataPageState();
}

class _PokemonDataPageState extends ConsumerState<PokemonDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.pokemon.getMainType().color,
      body: SafeArea(
        child: Stack(
          children: [
            const SizedBox(
              width: double.infinity,
              height: double.infinity,
            ),
            Positioned(
              top: 0,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        '# ${widget.pokemon.id}',
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                      Text(
                        '${'${widget.pokemon.name}'.characters.first.toUpperCase()}${'${widget.pokemon.name}'.substring(1)}',
                        style:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                ),
                      ),
                    ],
                  ),
                ),
              ),
            )
                .animate()
                .fadeIn(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                )
                .moveX(
                  duration: const Duration(milliseconds: 500),
                  begin: 10,
                  end: 0,
                  curve: Curves.easeIn,
                ),
            Positioned(
              top: 150.0,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RotatedBox(
                      quarterTurns: 3,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: RichText(
                          textDirection: TextDirection.ltr,
                          text: TextSpan(
                            text: 'Species: ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                            children: <TextSpan>[
                              TextSpan(
                                text: '${widget.pokemon.species?.name}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                        .animate()
                        .fadeIn(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        )
                        .moveY(
                          duration: const Duration(milliseconds: 500),
                          begin: 10,
                          end: 0,
                          curve: Curves.easeIn,
                        ),
                    const SizedBox(
                      width: 30.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              RichText(
                                textDirection: TextDirection.ltr,
                                text: TextSpan(
                                  text: 'Height: ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: '${widget.pokemon.height}m',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
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
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: '${widget.pokemon.weight}kg',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: Colors.white,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                              .animate()
                              .fadeIn(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn,
                              )
                              .moveX(
                                duration: const Duration(milliseconds: 500),
                                begin: 10,
                                end: 0,
                                curve: Curves.easeIn,
                              ),
                          // Todo: add stat here
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned.fromRelativeRect(
              rect: const RelativeRect.fromLTRB(30.0, 150, 30.0, 0),
              child: CachedNetworkImage(
                imageUrl: getPokemonOfficialImageUrl(widget.id.toString()),
                fit: BoxFit.contain,
                errorWidget: (BuildContext context, String url, error) =>
                    Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

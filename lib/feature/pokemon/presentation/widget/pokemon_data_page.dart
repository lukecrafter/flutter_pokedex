import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_pokedex/feature/home/model/pokemon_response.dart';
import 'package:flutter_pokedex/feature/home/provider/home_provider.dart';
import 'package:flutter_pokedex/feature/pokemon/presentation/widget/pokemon_data_basic_detail.dart';
import 'package:flutter_pokedex/feature/pokemon/presentation/widget/pokemon_data_stat_board.dart';
import 'package:flutter_pokedex/shared/app_colors.dart';
import 'package:flutter_pokedex/shared/enum/pokemon_type_enum.dart';
import 'package:flutter_pokedex/shared/extension/pokemon_response_extension.dart';
import 'package:flutter_pokedex/shared/extension/string_extension.dart';
import 'package:flutter_pokedex/shared/util/pokemon_util.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

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
  bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.pokemon.getMainType().color,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => setState(() => _isClicked = !_isClicked),
          child: Stack(
            children: [
              const SizedBox(
                width: double.infinity,
                height: double.infinity,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 10.0,
                    right: 10.0,
                  ),
                  child: Text(
                    '# ${widget.pokemon.id}',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ).animate(target: _isClicked ? 1 : 0).fadeOut(),
              Positioned(
                top: 0,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AnimatedCrossFade(
                          crossFadeState: _isClicked
                              ? CrossFadeState.showSecond
                              : CrossFadeState.showFirst,
                          duration: const Duration(milliseconds: 500),
                          firstChild: GestureDetector(
                            onTap: () => GoRouter.of(context).pop(),
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.black87.withOpacity(0.6),
                            ),
                          ),
                          secondChild: Text(
                            '# ${widget.pokemon.id}',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                        Text(
                          '${widget.pokemon.name}'.firstLetterToUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: ShapeDecoration(
                            shape: const StadiumBorder(),
                            color: AppColors.grey.withOpacity(0.6),
                          ),
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              for (final Types type
                                  in widget.pokemon.types ?? [])
                                Padding(
                                  padding: const EdgeInsets.only(right: 5.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 20.0,
                                        height: 20.0,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: type.type?.pokemonTypes
                                              ?.iconColor(),
                                        ),
                                        padding: const EdgeInsets.all(5.0),
                                        child: SvgPicture.asset(
                                          'assets/images/pokemon/types/${type.type?.pokemonTypes?.name}.svg',
                                          fit: BoxFit.cover,
                                          width: 10.0,
                                          height: 10.0,
                                        ),
                                      ),
                                      const SizedBox(width: 5.0),
                                      Text(
                                        '${type.type?.pokemonTypes?.name}',
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ).animate(target: _isClicked ? 1.0 : 0.0).fadeOut(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeIn,
                            ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RotatedBox(
                              quarterTurns: 3,
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
                                  PokemonDataBasicDetail(
                                    height: widget.pokemon.height.toString(),
                                    weight: widget.pokemon.weight.toString(),
                                  )
                                      .animate()
                                      .fadeIn(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.easeIn,
                                      )
                                      .moveX(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        begin: 10,
                                        end: 0,
                                        curve: Curves.easeIn,
                                      ),
                                  PokemonDataStatBoard(pokemon: widget.pokemon)
                                      .animate()
                                      .fadeIn(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.easeIn,
                                      )
                                      .moveY(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        begin: 20,
                                        end: 0,
                                        curve: Curves.easeIn,
                                      ),
                                ],
                              ),
                            )
                          ],
                        ).animate(target: _isClicked ? 1.0 : 0.0).fadeOut(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeIn,
                            ),
                      ],
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
              ),
              Positioned.fromRelativeRect(
                rect: const RelativeRect.fromLTRB(30.0, 300, 30.0, 0),
                child: Dismissible(
                  key: ValueKey(widget.id),
                  resizeDuration: null,
                  onUpdate: (DismissUpdateDetails deatils) {},
                  confirmDismiss: (DismissDirection direction) async {
                    if (direction == DismissDirection.endToStart) {
                      if (int.parse(widget.id) == 1) {
                        return false;
                      }
                    } else if (direction == DismissDirection.startToEnd) {
                      return !(ref.read(homeNotifierProvider).state.last.id ==
                          int.parse(widget.id));
                    }
                    return true;
                  },
                  onDismissed: (DismissDirection direction) {
                    if (direction == DismissDirection.endToStart) {
                      GoRouter.of(context).goNamed(
                        'pokemon',
                        params: {
                          'id': ((int.parse(widget.id) - 1).toString())
                              .toString(),
                        },
                      );
                    } else if (direction == DismissDirection.startToEnd) {
                      GoRouter.of(context).goNamed(
                        'pokemon',
                        params: {
                          'id': ((int.parse(widget.id) + 1).toString())
                              .toString(),
                        },
                      );
                    }
                  },
                  child: CachedNetworkImage(
                    imageUrl: getPokemonOfficialImageUrl(widget.id.toString()),
                    fit: BoxFit.contain,
                    errorWidget: (BuildContext context, String url, error) =>
                        Container(),
                  ),
                ).animate().fadeIn(
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.easeInOut,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

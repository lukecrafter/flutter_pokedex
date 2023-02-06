import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/feature/home/model/pokemon_response.dart';
import 'package:flutter_pokedex/shared/pokemon_type_enum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PokemonCard extends ConsumerStatefulWidget {
  final int id;
  final String name;
  final String imageUrl;
  final List<Types> types;
  final Color color;

  const PokemonCard({
    super.key,
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.types,
    required this.color,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PokemonCardState();
}

class _PokemonCardState extends ConsumerState<PokemonCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(8.0, 8.0),
            blurRadius: 8.0,
            color: Colors.grey.shade500,
          ),
        ],
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            widget.color,
            widget.color,
            Colors.white,
          ],
        ),
      ),
      child: Stack(
        children: [
          const SizedBox(
            width: double.infinity,
            height: double.infinity,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.name,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        '#${widget.id}',
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  for (final Types type in widget.types ?? [])
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        children: [
                          Container(
                            width: 20.0,
                            height: 20.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: type.type?.pokemonTypes?.iconColor(),
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
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: SizedBox(
              child: CachedNetworkImage(
                imageUrl: widget.imageUrl,
                imageBuilder: (
                  BuildContext context,
                  ImageProvider<Object> imageProvider,
                ) {
                  return SizedBox(
                    width: 80.0,
                    child: Image(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  );
                },
                fit: BoxFit.cover,
                errorWidget: (BuildContext context, String url, error) =>
                    Container(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter_pokedex/feature/home/model/pokemon_list_response_result.dart';

class PokemonListResponse {
  int? count;
  String? next;
  String? previous;
  List<PokemonListResponseResult>? results;

  PokemonListResponse({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  PokemonListResponse copyWith({
    int? count,
    String? next,
    String? previous,
    List<PokemonListResponseResult>? results,
  }) {
    return PokemonListResponse(
      count: count ?? this.count,
      next: next ?? this.next,
      previous: previous ?? this.previous,
      results: results ?? this.results,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'next': next,
      'previous': previous,
      'results': results,
    };
  }

  factory PokemonListResponse.fromJson(Map<String, dynamic> json) {
    return PokemonListResponse(
      count: json['count'] as int?,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>?)
          ?.map(
            (e) =>
                PokemonListResponseResult.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );
  }
}

class PokemonListResponseResult {
  String? name;
  String? url;

  PokemonListResponseResult({
    this.name,
    this.url,
  });

  PokemonListResponseResult copyWith({
    String? name,
    String? url,
  }) {
    return PokemonListResponseResult(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'url': url,
    };
  }

  factory PokemonListResponseResult.fromJson(Map<String, dynamic> json) {
    return PokemonListResponseResult(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );
  }
}

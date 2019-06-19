import 'package:flutter/material.dart';
import 'package:flutter_pokedex_app/src/models/pokemon.dart';
import 'package:flutter_pokedex_app/src/utils/utilities_methods.dart';

class PokemonDetails extends StatelessWidget {
  final Pokemon pokemon;
  PokemonDetails({@required this.pokemon});
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Utilities.getColor(pokemon.type[0]),
      child: Center(
        child: Hero(
          tag: pokemon.img,
          child: Image.network(pokemon.img),
        ),
      ),
    );
  }
}

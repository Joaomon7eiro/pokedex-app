import 'package:flutter/material.dart';
import 'package:flutter_pokedex_app/src/data/network_repository.dart';
import 'package:flutter_pokedex_app/src/models/pokemon.dart';
import 'package:flutter_pokedex_app/src/utils/utilities_methods.dart';
import 'package:flutter_pokedex_app/src/ui/pokemon_details.dart';

class PokedexPage extends StatefulWidget {
  @override
  _PokedexPageState createState() => _PokedexPageState();
}

class _PokedexPageState extends State<PokedexPage> {
  PokemonHub pokemonHub;

  Future<dynamic> getPokemons() async {
    NetWorkRepository repository = NetWorkRepository.getInstance();
    pokemonHub = await repository.getPokemons();
    setState(() {});
  }

  List<Card> getPokemonsList() {
    List<Card> pokemonsList = [];

    for (Pokemon pokemon in pokemonHub.pokemons) {
      Card pokemonCard = Card(
        color: Utilities.getColor(pokemon.type[0]),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return PokemonDetails(
                pokemon: pokemon,
              );
            }));
          },
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      pokemon.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    Column(
                      children: pokemon.type.map(
                        (type) {
                          Color typeColor = Utilities.getColor(type);
                          return Container(
                            margin: EdgeInsets.only(top: 5),
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            decoration: BoxDecoration(
                                color:
                                    typeColor.withGreen(typeColor.green + 20),
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              type,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Hero(
                  tag: pokemon.img,
                  child: Image.network(pokemon.img),
                ),
              )
            ],
          ),
        ),
      );
      pokemonsList.add(pokemonCard);
    }
    return pokemonsList;
  }

  @override
  void initState() {
    super.initState();
    getPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          margin: EdgeInsets.all(20),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate([
                  Container(
                    margin: EdgeInsets.all(16),
                    child: Text(
                      'Pokedex',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ]),
              ),
              pokemonHub != null
                  ? SliverGrid.count(
                      crossAxisCount: 2,
                      children: getPokemonsList(),
                    )
                  : SliverList(
                      delegate: SliverChildListDelegate([
                        Center(
                          child: CircularProgressIndicator(),
                        ),
                      ]),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter_pokedex_app/src/utils/network_util.dart';
import 'package:flutter_pokedex_app/src/models/pokemon.dart';

const url =
    'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';

class NetWorkRepository {
  static NetWorkRepository _netWorkRepository;

  static NetWorkRepository getInstance() {
    if (_netWorkRepository == null) {
      _netWorkRepository = NetWorkRepository();
    }
    return _netWorkRepository;
  }

  Future<PokemonHub> getPokemons() async {
    var data = await NetworkUtil().getData(url);
    return PokemonHub.fromJson(data);
  }
}

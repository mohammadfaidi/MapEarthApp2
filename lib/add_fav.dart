import 'package:earch1/favCountry.dart';

class AddFavorite {

var _isFavorite ;
static List <FavCountry> fav = [];

static void add(favCountry,bool _isFavorite,String name){

  if (_isFavorite == true){
    var counName = fav.where((country) => country.name == name).toList();
    if (counName.isEmpty){
      fav.add(favCountry);
    }

  }
}

}
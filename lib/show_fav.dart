import 'package:earch1/add_fav.dart';
import 'package:flutter/material.dart';

class ShowFav extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite Screen'),
        centerTitle: true,

      ),
      body:ListView.builder(
        itemCount: AddFavorite.fav.length,
        itemBuilder: (context, index) {

         return   Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
              child: Card(
                elevation: 4.0,
                color: Colors.orangeAccent,
                child: ListTile(
                 
                  title: Text(AddFavorite.fav[index].name),
                  subtitle: Text(AddFavorite.fav[index].native),
                  trailing: Text(AddFavorite.fav[index].flag),
                //  leading: Icon(Icon(Icons.flag)),
                  
                ),
              ),
            );

        }) ,
    );
  }
}
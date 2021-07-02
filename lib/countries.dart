
import 'dart:convert';

import 'package:earch1/add_fav.dart';
import 'package:earch1/ditalscountry.dart';
import 'package:earch1/favCountry.dart';
import 'package:earch1/show_fav.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:favorite_button/favorite_button.dart';

class Countreis extends StatefulWidget {
String id ;
String name ; 

Countreis({@required this.id,this.name});

@override
_CountriesState createState() => _CountriesState();


}

class _CountriesState extends State<Countreis> {
Map _map;
List country;
bool isSearching = false;
List countries = [];
List favourite  = [];

List searchlist = [];
bool hart = false;
bool _folded = true; 
final controller = TextEditingController();
String isExist;

bool _isFavorite;
FavCountry favCountry;



Future<List> getCountry ()async {
  final String response = await rootBundle.loadString('json/data.json');
  final data = await json.decode(response);
 
  setState(() {
      _map = data['countries'];
      country  = _map.values.toList();
    });

  for(var i =0 ; i<country.length ; i++){
    var countryOfCon = country[i]['continent'];
    if (widget.id == countryOfCon){
      countries.add(country[i]);
      searchlist = countries;
    }
  } 
return countries;
}
void _filterSearch(value) {

    print(value);



    setState(() {

      searchlist = countries

          .where((country) =>

              country['name'].toLowerCase().contains(value.toLowerCase()))

          .toList();

    });

  }





@override
void initState(){
  getCountry();
  super.initState();
 
}

 void _clearTextField() {
    // Clear everything in the text field
    controller.clear();
    // Call setState to update the UI
    setState(() {});
  }

@override
Widget build(BuildContext context){
     
  return Scaffold(
      appBar: AppBar(

        title: !isSearching ?Text(widget.name,style: TextStyle(letterSpacing: 4),):TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(hintText: "Search Country here:",
          hintStyle: TextStyle(color: Colors.white),
          ),
        ),
        centerTitle: true,
        actions: [

          Padding(

            padding: const EdgeInsets.all(8.0),

            child: AnimatedContainer(

              duration: Duration(milliseconds: 400),

              width: _folded ? 45 : MediaQuery.of(context).size.width / 1.2,

              height: 50,

              decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(32),

                color: Colors.white,

                boxShadow: kElevationToShadow[6],

              ),

              child: Row(

                children: [

                  Expanded(

                    child: Container(

                        padding: EdgeInsets.only(left: 16),

                        child: !_folded

                            ? TextField(

                                onChanged: (value) {

                                  _filterSearch(value);

                                },

                                decoration: InputDecoration(

                                    border: InputBorder.none,

                                    hintText: 'Search',

                                    helperStyle: TextStyle(

                                      color: Colors.orangeAccent,

                                    )),

                              )

                            : null),

                  ),

                  AnimatedContainer(

                    duration: Duration(milliseconds: 400),

                    child: Material(

                      type: MaterialType.transparency,

                      borderRadius: BorderRadius.only(

                        topLeft: Radius.circular(_folded ? 32 : 0),

                        topRight: Radius.circular(32),

                        bottomRight: Radius.circular(32),

                        bottomLeft: Radius.circular(_folded ? 32 : 0),

                      ),

                      child: InkWell(

                          onTap: () {

                            setState(() {

                              searchlist = countries;

                              _folded = !_folded;

                            });

                          },

                          child: Padding(

                            padding: const EdgeInsets.all(10),

                            child: Icon(

                              _folded ? Icons.search : Icons.close,

                              color: Colors.orangeAccent

                            ),

                          )),

                    ),

                  )

                ],

              ),

            ),

          ),



          
         
        ],
        backgroundColor: Colors.orangeAccent,
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
          
          
            Expanded(
              child: searchlist.length > 0 ? ListView.builder(
                      itemCount: searchlist.length,
                      itemBuilder: (context, index) => Card(
                        color: Colors.orangeAccent,
                        elevation: 4,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        
                        child: ListTile(
                          onTap: (){
 Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CountriesDetails(
                                 // name: countries[index]["name"],
                                 name: searchlist[index]["name"],
                                  continent: searchlist[index]["continent"],
                                  emoji: searchlist[index]["emoji"],
                                  native: searchlist[index]["native"],
                                  phone: searchlist[index]["phone"],
                                  languages: searchlist[index]["languages"],
                                )));

                          },
                          leading: Text(searchlist[index]["emoji"]),
                          trailing://IconButton(icon: Icon(Icons.favorite), onPressed: (){}),
                            FavoriteButton(
                              isFavorite: false,
                              valueChanged: (_isFavorite){
                                var name = searchlist[index]["name"];
                                var flag = searchlist[index]["emoji"];
                                var native = searchlist[index]["native"];
                                favCountry = FavCountry(name,native,flag);
                    AddFavorite.add(favCountry, _isFavorite, name);
                              },
iconColor: Colors.red,
                          ),

                          title: Text(searchlist[index]['name'],style: TextStyle(fontWeight: FontWeight.bold),),
                         // subtitle: Text(
                           //   '${_foundUsers[index]["age"].toString()} years old'),
                        ),
                      ),
                    ): Center(child: CircularProgressIndicator()),
                  
            ),
          ],
        ),
      ),
        floatingActionButton: FloatingActionButton(
        // isExtended: true,
        child: Icon(Icons.favorite),
        backgroundColor: Colors.orangeAccent,
        foregroundColor: Colors.red,
        onPressed: () {
           Navigator.push(context, MaterialPageRoute(builder: (context)=>
    ShowFav(),
   
    ));
        },
      ),
      

    );  
     
}

  Future <void>_showValue(BuildContext context)async {

    print("Hello");
  }
Widget snackBBar(context){
    
   final snackBar = SnackBar(content:
    Text("Country is exist  : ${isExist}  "
        ,textAlign: TextAlign.center,
    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.orangeAccent),)
      ,backgroundColor: Colors.black,
          behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.all(30.0),
                  duration: const Duration(seconds: 5),
      
      );
      
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}
 
//Text(countries[index]["name"],style: TextStyle(
  //                           color: Colors.green,fontSize: 15),);

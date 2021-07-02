import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:flutter/services.dart';

class CountriesDetails extends StatefulWidget {
  String name;
  String native;
  String phone;
  String emoji;
  String continent;
  List languages;

  CountriesDetails({
    @required this.name,
    @required this.continent,
    @required this.native,
    @required this.phone,
    @required this.emoji,
    @required this.languages,
  });
  //const CountriesDetails({Key? key}) : super(key: key);

  @override
  CountriesDdetailsState createState() => CountriesDdetailsState();
}

class CountriesDdetailsState extends State<CountriesDetails> {
  Map _map;
  List country;
  List countries = [];
  bool favorite = false;

  Future<List> getCountry() async {
    final String response = await rootBundle.loadString('assets/api/data.json');
    final data = await json.decode(response);
    setState(() {
      _map = data['countries'];
      country = _map.values.toList();
    });

    for (var i = 0; i < country.length; i++) {
      var countryOfCon = country[i]['continent'];
      if (widget.name == countryOfCon) {
        countries.add(country[i]);
      }
    }
    return countries;
  }

  @override
  void initState() {
    getCountry();
    super.initState();
  }

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.name),
          centerTitle: true,
          backgroundColor: Colors.orange,
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.repeated,
              colors: [Colors.orange, Colors.white],
            ),
          ),
          child: Column(
            children: [
             
              Expanded(
                flex: 3,
                child: Container(
                  margin:
                      EdgeInsets.only(bottom: 60, left: 10, right: 10, top: 10),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange,
                        offset: Offset(3, 3),
                        blurRadius: 2,
                      )
                    ],
                    borderRadius: BorderRadius.circular(50),
                    color: Color.fromRGBO(230, 230, 250, 1),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      CircleAvatar(
                        child: Text(
                          widget.emoji,
                          style: TextStyle(fontSize: 40),
                        ),
                        backgroundColor: Colors.white,
                        radius: 50,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Data Country',
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                         
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Divider(
                        thickness: 2,
                        endIndent: 90,
                        indent: 90,
                      ),
                      ListTitle(
                        name: widget.name,
                        title: "Name : ",

                      ),
                      Divider(),
                      ListTitle(
                        name: widget.native,
                        title: "native : ",
                      ),
                      Divider(),
                      ListTitle(
                        name: widget.phone,
                        title: "phone : ",
                      ),
                      Divider(),
                      ListTitle(
                        name: widget.continent,
                        title: "continent : ",
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Widget ListTitle({String name, String title}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            name,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.orange,
            ),
          ),
        ],
      ),
    );

    // ListTile(
    //   leading: Text(
    //     title,
    //     style: TextStyle(
    //       fontSize: 20,
    //       fontWeight: FontWeight.w500,
    //     ),
    //   ),
    //   title: Text(
    //     name,
    //     style: TextStyle(
    //       fontSize: 20,
    //       fontWeight: FontWeight.w500,
    //       color: ColoresDark.red,
    //     ),
    //   ),
    // );
  }
}
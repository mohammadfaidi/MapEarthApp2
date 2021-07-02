
import 'package:earch1/countries.dart';
import 'package:flutter/material.dart';

class Componets extends StatelessWidget {
  
List <String> keycontinents = ["AF", "AN","AS","EU","NA","OC","SA"];
List <String> continents = [ "Africa","Antarctica","Asia","Europe","North America","Oceania","South America"];
//int count=0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
        
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
              InkWell(
                child: maps("Europa","images/Europe.png",),
              onTap: (){
                var id = keycontinents[3];
                var name = continents[3];
 Navigator.push(context, MaterialPageRoute(builder: (context)=>
    Countreis(id :id ,name:name)
    
    ));
              },
              ),
              InkWell(child: maps("Aferica","images/Africa.png"),
              onTap: (){
                var id = keycontinents[0];
                var name = continents[0];
 Navigator.push(context, MaterialPageRoute(builder: (context)=>
    Countreis(id :id ,name:name)
    
    ));
              },
              ),
           
 

          ],
        ),
 Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
              InkWell(child: maps("Austrillia","images/Austrilia.png"),
              onTap: (){
                var id = keycontinents[5];
                var name = continents[5];
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>
    Countreis(id :id ,name:name)
    
    ));
              },
              ),
              InkWell(child: maps("North America","images/North America.png"),
              onTap: (){
                   var id = keycontinents[4];
                var name = continents[4];

                 Navigator.push(context, MaterialPageRoute(builder: (context)=>
    Countreis(id :id ,name:name)
    
    ));

              },
              ),
           
 

          ],
        ),
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
              InkWell(child: maps("South America","images/South America.png"),
              onTap: (){
                   var id = keycontinents[6];
                var name = continents[6];
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>
    Countreis(id :id ,name:name)
    
    ));
              },
              ),
              InkWell(child: maps("Asia","images/a.png"),
              onTap: (){
                var id = keycontinents[2];
                var name = continents[2];
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>
    Countreis(id :id ,name:name)
    
    ));
              },
              ),
           
 

          ],
        ),
         InkWell(child: maps("Antarcatica","images/Antarcatica.png"),
         onTap: (){
                var id = keycontinents[1];
                var name = continents[1];
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>
    Countreis(id :id ,name:name)
    
    ));
         },),
         
        ],

      ),
    );
  
  }

 Widget maps(txt,img){
   return  Card(
child: Container(
  alignment: Alignment.bottomCenter,
width: 140,
height: 110,
decoration: BoxDecoration(
borderRadius:BorderRadius.circular(13),
color :Color(0xff043551),
image: DecorationImage(
                                      image:AssetImage(img),
                                      fit: BoxFit.contain,
                                    ),

),
child: Text(txt,style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),)
),
            );

 }


}
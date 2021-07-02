import 'dart:async';

import 'package:earch1/components.dart';
import 'package:earch1/favourite.dart';
import 'package:earch1/show_fav.dart';
import 'package:earch1/theme.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:provider/provider.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
 
void main() => runApp(
   MyApp(),
      
      );
 
	class MyApp extends StatelessWidget {
  
    @override
    Widget build(BuildContext context) {
      return ChangeNotifierProvider(

      create: (_) => ThemeChanger(ThemeData(

        scaffoldBackgroundColor: Colors.white,

        primaryColor: Colors.white,

        colorScheme: ColorScheme.light(),

        switchTheme: SwitchThemeData(

            thumbColor: MaterialStateProperty.all(Colors.white),

            trackColor: MaterialStateProperty.all(Colors.red)),

      )),

      child: MaterialAppTheme(),

    );
    }
  }

  class MaterialAppTheme extends StatelessWidget {
  
    @override
    Widget build(BuildContext context) {
      final theme = Provider.of<ThemeChanger>(context);
      return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.getTheme(),
      title: "Contacts",
      
   
      home: splashScreen1(),
      );
    }
  }
 
class MyHomePage extends StatefulWidget {
  
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
 
class _MyHomePageState extends State<MyHomePage> {
  
 bool _status = true;
  int _selectedIndex = 0;
 List <Widget> _widgets = <Widget> [


  // Text("Profile",style:TextStyle(fontSize: 20))
  Componets(),
  //Text("Settings",style:TextStyle(fontSize: 20)),
  //SlimyCardDemo(),
  ShowFav(),

 ];
 void _onItemTapped(int index){
   setState(() {
     _selectedIndex = index;
   });
 }
  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    return  Scaffold(
      appBar: AppBar(
        //primary: false,
        
        title: //Text("COW",style: TextStyle(color:Color(0xff043551) ,fontSize: 30,fontWeight: FontWeight.bold,letterSpacing: 5),),
         AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                ' COW MaPs',
                textStyle: const TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 5,
                  color: Colors.orangeAccent
                ),
              ),
            ],
               totalRepeatCount: 10,
               pause: const Duration(milliseconds: 1000),
               displayFullTextOnTap: true,
               stopPauseOnTap: true,
          ),
        centerTitle: true,
  backgroundColor: Colors.transparent,
  elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.orangeAccent),

      ),
          bottomNavigationBar: 
    
  BottomNavigationBar(
    
    backgroundColor: Colors.orange,
  selectedItemColor: Colors.black,
  unselectedItemColor: Colors.white,
  
    items:<BottomNavigationBarItem>[
BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Fav0rite',
          ),
        
         
        
        
  ],
  currentIndex: _selectedIndex,
  onTap: _onItemTapped,
  ),
            drawer: Drawer(
    child:ListView(
children:<Widget>[
  DrawerHeader(
child:Column(children: [
  Expanded(child: 
  //Image.network("https://miro.medium.com/max/1000/1*ilC2Aqp5sZd1wi0CopD1Hw.png",width:200),
 /*
 CircleAvatar(
radius: 85,
backgroundColor: Colors.blueGrey,
//backgroundImage:// NetworkImage("https://www.globalpeacechain.org/wp-content/uploads/2019/06/58375852_2043258939310210_1694514200572854272_n.jpg"),
backgroundImage: AssetImage("images/ear.png"),
 ),
  */
  Container(
  decoration: BoxDecoration(
    color: Colors.black,
    shape: BoxShape.circle,
    boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black, spreadRadius: 5)],
  ),
  child: CircleAvatar(
    radius: 85.0,
    backgroundImage: AssetImage("images/map.png"),
  ),
),
  ),
  SizedBox(height:10),
  Text("Mohammad Faidi",style:TextStyle(fontSize: 20,color: Colors.blueGrey,fontWeight: FontWeight.bold)),
  SizedBox(height:10),
  Container(
    height: 2,
    color: Colors.grey,
   // margin: EdgeInsets.all(12),
  ),
],
),
decoration: BoxDecoration(color: Colors.white),
  ),
  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child:SwitchListTile(

                      title: Text(

                        "Dark Mode",

                        style: TextStyle(

                          fontWeight: FontWeight.w500,

                          color: Colors.black,

                        ),

                      ),

                      value: _status,

                      onChanged: (val) {

                        setState(() {

                          if (_status = val) {

                            val = _themeChanger.setTheme(ThemeData(

                              scaffoldBackgroundColor: Colors.black,

                              colorScheme: ColorScheme.dark(),

                              primaryColor: Colors.black,

                              switchTheme: SwitchThemeData(

                                  thumbColor: MaterialStateProperty.all(

                                      Colors.black),

                                  trackColor: MaterialStateProperty.all(

                                    Colors.white,

                                  )),

                            ));

                          } else {

                            val = _themeChanger.setTheme(ThemeData(

                              scaffoldBackgroundColor: Colors.white,

                              primaryColor: Colors.white,

                              colorScheme: ColorScheme.light(),

                              switchTheme: SwitchThemeData(

                                  thumbColor:

                                      MaterialStateProperty.all(Colors.white),

                                  trackColor:

                                      MaterialStateProperty.all(Colors.red)),

                            ));

                          }

                        });

                      }),
  ),
  
 

],
    ),
  ),
  body: Container(
    child:
  _widgets.elementAt(_selectedIndex),
  ),
    


    );
 }



}


class splashScreen1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   var timer = Timer(Duration(seconds: 2),(){
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> splashScreen2()));
   });
   return Scaffold(
     body: Center(child: CircularProgressIndicator(),),
   );
  
  
  }



}


class splashScreen2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SplashScreenView(navigateRoute: MyHomePage(),
    duration: 3000,
    imageSize: 180,
    imageSrc: "images/map.png",
    text: "Earch App",
    backgroundColor: Colors.white,
    textType: TextType.ColorizeAnimationText,
      textStyle: TextStyle(
        fontSize: 40.0,
      ),
       colors: [
        Colors.purple,
        Colors.blue,
        Colors.yellow,
        Colors.red,
      ],
    );
  
  
  }



}
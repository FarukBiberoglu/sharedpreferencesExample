import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled32/secondPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<void> veriKaydi() async {

    var sp = await SharedPreferences.getInstance();

    sp.setString("ad", "ahmet");
    sp.setInt("yas", 18);
    sp.setDouble("boy", 1.78);
    sp.setBool("bekarMi", true);

    List<String> arkadasListe = [];
    arkadasListe.add("Ece");
    arkadasListe.add("Ali");

    sp.setStringList("arkadasListe", arkadasListe);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anasayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text("Geçiş Yap"),
              onPressed: (){

                veriKaydi();

                Navigator.push(context, MaterialPageRoute(builder: (context) => SayfaA()));
              },
            ),
          ],
        ),
      ),

    );
  }
}
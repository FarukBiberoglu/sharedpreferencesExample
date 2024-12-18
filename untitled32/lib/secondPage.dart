import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SayfaA extends StatefulWidget {
  const SayfaA({super.key});

  @override
  State<SayfaA> createState() => _SayfaAState();
}

class _SayfaAState extends State<SayfaA> {
  Future<void> veriOku() async {
    var sp = await SharedPreferences.getInstance();
    String ad = sp.getString('ad') ?? 'isimyok';
    int yas = sp.getInt('yas') ?? 99;
    double boy = sp.getDouble('boy') ?? 180 ;
    bool bekarmi = sp.getBool('bekarMi') ?? false;
    var arkadasListe = sp.getStringList('arkadasListe') ?? null;
    print('ad: $ad');
    print('yas: $yas');
    print('boy: $boy');
    print('Bekarmi?: $bekarmi');
    for (var a in arkadasListe!){
      print('arkadas : $a');
    }


  }
  Future<void> veriSil() async {
    var sp = await SharedPreferences.getInstance();
    sp.remove('ad');
  }
  Future<void> veriGuncelle() async {
    var sp = await SharedPreferences.getInstance();
    sp.setInt('yas', 100);

  }


  @override
  void initState() {
    veriGuncelle();
    veriSil();
    veriOku();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shared'),),
      body: Center(
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:haber_uygulamasi/Pages/Finans.dart';
import 'package:haber_uygulamasi/Pages/Gundem.dart';
import 'package:haber_uygulamasi/Pages/Magazin.dart';
import 'package:haber_uygulamasi/Pages/Bilim.dart';
import 'package:haber_uygulamasi/Pages/Spor.dart';
import 'package:haber_uygulamasi/Pages/Saglik.dart';
import 'package:haber_uygulamasi/category/Bildirimler.dart';
import 'package:haber_uygulamasi/category/SonDakika.dart';
import 'package:haber_uygulamasi/category/YurtHaber.dart';
import 'package:haber_uygulamasi/services/api_service.dart';

import 'package:url_launcher/url_launcher.dart';

import '../model/article_model.dart';
import 'Ayarlar.dart';
import 'Teknoloji.dart'; //html ayrıştırma ///Herhangi bir Html sayfasından istediğimiz yerleri alabilir ve uygulamalarımızda kullanabiliriz.
//API_KEY: "016bfc86c5c546b6b5265fdb9b8c612f"

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

_launchURLBrowser() async {
  const url =
      'https://mgm.gov.tr/tahmin/il-ve-ilceler.aspx?il=Denizli&ilce=Merkez';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class _HomePageState extends State<HomePage> {
  void initState() {}


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 7,
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: Text("admin admin"),
                accountEmail: Text("admin@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                ), //backgroundImage: NetworkImage(""),),
                decoration: BoxDecoration(color: Colors.red),
              ),
              ListTile(
                title: const Text('Anasayfa'),
                onTap: () {
                  Navigator.pop(context);
                },
                leading: Icon(Icons.home),
              ),
              ListTile(
                title: const Text('Son Dakika'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SonDakika()));
                },
                leading: Icon(Icons.access_time_outlined),
              ),
              ListTile(
                title: const Text('Yurt Haber'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => YurtHaber()));
                },
                leading: Icon(Icons.calendar_month),
              ),
              ListTile(
                title: const Text('Bildirimler'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Bildirimler()));
                },
                leading: Icon(Icons.notifications_active_outlined),
              ),
              ListTile(
                title: const Text('Hava Durumu'),
                onTap: _launchURLBrowser,
                leading: Icon(Icons.wb_sunny_outlined),
              ),
              Divider(
                color: Colors.black,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Kategoriler"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Ayarlar()));
                      },
                      child: Text("Ayarlar"))
                ],
              ),
              ListTile(
                title: const Text('Gündem'),
                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Gundem()));},
                leading: Icon(Icons.circle_outlined),
              ),
              ListTile(
                title: const Text('Magazin'),
                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Magazin()));},
                leading: Icon(Icons.circle_outlined),
              ),
              ListTile(
                title: const Text('Spor'),
                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Spor()));},
                leading: Icon(Icons.circle_outlined),
              ),
              ListTile(
                title: const Text('Finans'),
                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Finans()));},
                leading: Icon(Icons.circle_outlined),
              ),
              ListTile(
                title: const Text('Teknoloji'),
                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Teknoloji()));},
                leading: Icon(Icons.circle_outlined),
              ),
              ListTile(
                title: const Text('Sağlık'),
                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Saglik()));},
                leading: Icon(Icons.circle_outlined),
              ),
              ListTile(
                title: const Text('Bilim'),
                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Bilim()));},
                leading: Icon(Icons.circle_outlined),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(Icons.menu),
                color: Colors.black,
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          title: Text(
            "Haberler",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.black,

            isScrollable: true, //kaydırılabilir olamsı.
            dividerColor: Colors.red,
            labelColor: Colors.red,
            tabs: [
              Tab(
                text: "Gündem",
              ),
              Tab(
                text: "Magazin",
              ),
              Tab(
                text: "Spor",
              ),
              Tab(
                text: "Finans",
              ),
              Tab(
                text: "Teknoloji",
              ),
              Tab(
                text: "Bilim",
              ),
              Tab(
                text: "Sağlık",
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.notifications_active_outlined,
                color: Colors.black,
                size: 26.0,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Bildirimler()));
              },
            ),
          ],
        ),
        body: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 10),
              curve: Curves.fastOutSlowIn,
              decoration: BoxDecoration(color: Colors.red),

              width: MediaQuery.of(context).size.width,
              height: 100,
              child: Image.asset("assets/images/sondakika.png"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Güncel Manşetler",
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                  IconButton(
                      onPressed: () {
                        CircularProgressIndicator();
                      },
                      icon: Icon(Icons.refresh))
                ],
              ),
            ),
            Expanded(
              child: TabBarView(children: [
                Gundem(),
                Magazin(),
                Spor(),
                Finans(),
                Teknoloji(),
                Bilim(),
                Saglik(),
              ]),
            ),

          ],
        ),
      ),
    );
  }
}

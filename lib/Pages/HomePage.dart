

import 'package:flutter/material.dart';
import 'package:haber_uygulamasi/category/Bildirimler.dart';
import 'package:haber_uygulamasi/category/SonDakika.dart';
import 'package:haber_uygulamasi/category/YurtHaber.dart';
import 'package:haber_uygulamasi/utils/web_scraper.dart';
import 'package:http/http.dart'as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/computer.dart';
import 'Ayarlar.dart'; //html ayrıştırma ///Herhangi bir Html sayfasından istediğimiz yerleri alabilir ve uygulamalarımızda kullanabiliriz.
//API_KEY: "pub_204809156084dfbdf9014ce850fce8dc43dda"

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
_launchURLBrowser() async {
  const url = 'https://mgm.gov.tr/tahmin/il-ve-ilceler.aspx?il=Denizli&ilce=Merkez';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
class _HomePageState extends State<HomePage> {
  List<Computer> computers =[];
void initState(){
 getWebsiteData();
}

Future getWebsiteData()async{
  final url = Uri.parse("https://www.bundle.app/gundem");
  final response= await http.get(url);
  dom.Document html =dom.Document.html(response.body);

  final titles = html
      .querySelectorAll("h3:nth-child(3)")
      .map((element) => element.innerHtml.trim())//h2 arası
      .toList();
 final urls = html
     .querySelectorAll("a:nth-child(1)")
    .map((element) => "https://www.bundle.app${element.attributes["href"]}")
     .toList();
final images =html
    .querySelectorAll("img:nth-child(1)")
    .map((element) => element.attributes["src"]!)
    .toList();


  setState(() {
    computers = List.generate(
        titles.length,
            (index) => Computer(
                url: urls[index],image: images[index], info: "", title: titles[index]));
  });


}
  @override
  Widget build(BuildContext context) {
getWebsiteData();
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
                currentAccountPicture: CircleAvatar(backgroundColor: Colors.white,),//backgroundImage: NetworkImage(""),),
                decoration: BoxDecoration(
                    color: Colors.red
                ),),
              ListTile(title: const Text('Anasayfa'), onTap: () {Navigator.pop(context);},leading: Icon(Icons.home),),
              ListTile(title: const Text('Son Dakika'), onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>SonDakika()));},leading: Icon(Icons.access_time_outlined),),
              ListTile(title: const Text('Yurt Haber'), onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> YurtHaber()));},leading: Icon(Icons.calendar_month),),
              ListTile(title: const Text('Bildirimler'), onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> Bildirimler()));},leading: Icon(Icons.notifications_active_outlined),),
              ListTile(title: const Text('Hava Durumu'), onTap: _launchURLBrowser,leading: Icon(Icons.wb_sunny_outlined),),
              Divider(color: Colors.black,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Kategoriler"),
                  TextButton(onPressed: (){Navigator.push(context,MaterialPageRoute(builder:(context)=>Ayarlar()));}, child: Text("Ayarlar"))
                ],
              ),
              ListTile(title: const Text('Gündem'), onTap: () {},leading: Icon(Icons.circle_outlined),),
              ListTile(title: const Text('Magazin'), onTap: () {},leading: Icon(Icons.circle_outlined),),
              ListTile(title: const Text('Spor'), onTap: () {},leading: Icon(Icons.circle_outlined),),
              ListTile(title: const Text('Finans'), onTap: () {},leading: Icon(Icons.circle_outlined),),
              ListTile(title: const Text('Trend'), onTap: () {},leading: Icon(Icons.circle_outlined),),
              ListTile(title: const Text('Yemek'), onTap: () {},leading: Icon(Icons.circle_outlined),),
              ListTile(title: const Text('Politika'), onTap: () {},leading: Icon(Icons.circle_outlined),),
            ],
          ),
        ),
        appBar: AppBar(

          backgroundColor: Colors.white,
          leading: Builder(
            builder: (BuildContext context){
              return IconButton(
                onPressed: (){Scaffold.of(context).openDrawer();},
                icon: Icon(Icons.menu),
                color: Colors.black,
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
         title: Text("Haberler",style: TextStyle(color: Colors.black),),
         centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.black,
           
            isScrollable: true,//kaydırılabilir olamsı.
            dividerColor: Colors.red,
            labelColor: Colors.red,
            tabs: [
              Tab(text: "Gündem",),
              Tab(text: "Magazin",),
              Tab(text: "Spor",),
              Tab(text: "Finans",),
              Tab(text: "Trend",),
              Tab(text: "Politika",),
              Tab(text: "Yemek",),


            ],),
          actions: [
            IconButton(
              icon: Icon(
                Icons.notifications_active_outlined,
                color: Colors.black,
                size: 26.0,
              ),
              onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => Bildirimler()));
              },

            ),

          ],
        ),


        body: Column(
          children: [

              Container(
                decoration: BoxDecoration(color: Colors.red),
                width: MediaQuery.of(context).size.width,
                height: 250,
                child: ListView.builder(

                  padding: const EdgeInsets.all(12),
                  itemCount: computers.length,
                  itemBuilder: (context,index){
                    final computer = computers[index];
                    return ListTile(
                      leading: Image.network(computer.image,fit: BoxFit.fitHeight,width: 50,),
                      title: Text(computer.title),
                      subtitle: Text(computer.url),

                    );
                  },
                ),
              ),

            Text("deneme"),


          ],
        ),


      ),
    );
  }
}

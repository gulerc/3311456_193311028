import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Firebase/Firebase_islemleri.dart';
import 'LoginPage.dart';

class Kayitol extends StatefulWidget {
  const Kayitol({Key? key}) : super(key: key);

  @override
  State<Kayitol> createState() => _KayitolState();
}

class _KayitolState extends State<Kayitol> {
  final TextEditingController _isimController = TextEditingController();
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _sifreController = TextEditingController();
  final TextEditingController _sifreAgainController = TextEditingController();
  final TextEditingController _telefonNumarasi = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  girisservisi _girisservisi = girisservisi();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Kayıt Ol",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Ücretsiz Hesap Oluşturun.",
                    style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                  )
                ],
              ),
              Column(
                children: [
                  Center(
                    child: Container(
                      child: Center(
                        child: Column(
                          children: [
                            TextField(
                              controller: _isimController,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Colors.black,
                                  ),
                                  labelText: "Kullanıcı Adı",
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  )),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextField(
                              controller: _mailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.mail_outline,
                                    color: Colors.black,
                                  ),
                                  labelText: "Email",
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  )),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextField(
                              controller: _telefonNumarasi,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.phone,
                                    color: Colors.black,
                                  ),
                                  labelText: "Telefon Numarası",
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  )),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextField(
                              controller: _sifreController,
                              keyboardType: TextInputType.number,
                              obscureText: true,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.vpn_key,
                                    color: Colors.black,
                                  ),
                                  labelText: "Parola",
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  )),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextField(
                              controller: _sifreAgainController,
                              keyboardType: TextInputType.number,
                              obscureText: true,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.vpn_key,
                                    color: Colors.black,
                                  ),
                                  labelText: "Parolayı Tekrar Giriniz.",
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  )),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 1, left: 1),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border(
                    bottom: BorderSide(color: Colors.black),
                    top: BorderSide(color: Colors.black),
                    left: BorderSide(color: Colors.black),
                    right: BorderSide(color: Colors.black),
                  ),
                ),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {
                    _girisservisi
                        .kayitol(_isimController.text, _mailController.text,
                            _sifreController.text, _telefonNumarasi.text)
                        .then((value) {
                      return Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    });
                  },
                  color: Colors.red,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    // köşeleri yuvarlak dikdörtgen kenarlık için
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    "Kayıt Ol",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Hesabınız var mı?"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Center(
                        child: Text("Giriş Yap",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.red,
                            ))),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

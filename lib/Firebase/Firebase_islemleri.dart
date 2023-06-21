import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class girisservisi{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference kullanici = FirebaseFirestore.instance.collection('kullanici');



  Future<User?>girisyap(String mail, String sifre)async{               //giriş prensipleri
    var user= await _auth.signInWithEmailAndPassword(email: mail, password: sifre);
    return user.user;
  }

  cikisyap() async{                                         //çıkış prensipleri
    return await _auth.signOut();
  }
  // kayıt ol prensipleri firabase firestore

  Future<User?>kayitol(String isim, String mail, String sifre, String telefonNumarasi) async{
    var user= await _auth.createUserWithEmailAndPassword(email: mail, password: sifre);
    await firestore.collection("kayitOlanlar").doc(user.user!.uid).set({
      'kullaniciadi' : isim, 'kullanicimailadresi' : mail , 'kullanicitelefonnumarasi' : telefonNumarasi,
    });
    return user.user;
  }


}
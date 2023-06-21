
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Firebase/Firebase_islemleri.dart';
import 'HomePage.dart';
import 'KayıtOl.dart';
import 'SifremiUnuttum.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController? _Adsoyad = TextEditingController();
  final TextEditingController? _Sifre = TextEditingController();
  girisservisi _girisservisi= girisservisi();
  bool isRememberMe =false;
  @override

  Widget buildEmail(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Email",
          style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold
          ),
        ),


        SizedBox(height: 10,),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.black,
                    blurRadius: 6,
                    offset: Offset(0,2)
                )
              ]
          ),
          height: 60,
          child: TextField(
            controller: _Adsoyad!,
            keyboardType:TextInputType.emailAddress ,
            textInputAction: TextInputAction.next,
            style: TextStyle(
                color: Colors.black
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top:14),
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.black26,
                ),
                hintText: "Email",
                hintStyle: TextStyle(
                    color: Colors.black26
                )
            ),
          ),
        )
      ],
    );
  }
  Widget buildPassword(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Password",
          style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold
          ),
        ),

        SizedBox(height: 10,),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.black,
                    blurRadius: 6,
                    offset: Offset(0,2)
                )
              ]
          ),
          height: 60,
          child: TextField(
            controller: _Sifre,
            textInputAction: TextInputAction.done,
            obscureText: true,
            style: TextStyle(
                color: Colors.black
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top:14),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.black26,
                ),
                hintText: "Password",
                hintStyle: TextStyle(
                    color: Colors.black26
                )
            ),
          ),

        ),

      ],

    );
  }
  Widget buildForgotPassword(){
    return Container(
      alignment: Alignment.centerRight,
      child: MaterialButton(child: Text(
        "Şifremi Unuttum",
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
        ) ,
      ),
        onPressed: (){ Navigator.push(context, MaterialPageRoute(builder:(context)=>SifremiUnuttum()), );
        },
      ),
    );
  }
  Widget buildRemember(){
    return Container(
      height: 20,
      child: Row(
        children: <Widget>[
          Theme(data: ThemeData(unselectedWidgetColor: Colors.white), child: Checkbox(value: isRememberMe,checkColor: Colors.black,activeColor: Colors.white,onChanged: (value) {
            setState(() {
              isRememberMe = value!;
            });
          },
          ),
          ),
          Text(
            "Beni Hatırla",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    );
  }
  Widget buildLoginButon(){

    return Container(

      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,

      child: ElevatedButton(

        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          elevation: 5,
          padding: EdgeInsets.all(15),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
          ),),

        onPressed: ()=> {print("Giriş Yap Butonuna Basıldı."),
          _girisservisi.girisyap(_Adsoyad!.text, _Sifre!.text).then((value){
            return Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));}),},



        child: Text(
          "Giriş Yap",
          style: TextStyle(
            color: Colors.red,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),


      ),


    );


  }
  Widget buildSignUpButon(){
    return GestureDetector(//kullanıcın hareketini algılar
      onTap: (){ Navigator.push(context, MaterialPageRoute(builder:(context)=>Kayitol())); },
      child: RichText(// zengin metin sınıfı
        text: TextSpan(
            children: [
              TextSpan(//değişmez metin aralığı
                  text: "Hesabın yok mu ? ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700
                  )
              ),
              TextSpan(
                  text: "Kayıt Ol",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )
              )
            ]
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(// temayı kullanabilmek için
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(// hareket algılar
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(// renk geçişleri için
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.red.shade50,
                        //Colors.red.shade200,
                      //  Colors.red.shade500,

                        Colors.red.shade700,
                        Colors.red,
                      ],

                    )
                ),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(), //sayfanın kaydırılabilir olması
                  padding: EdgeInsets.symmetric(  //email kutucuğunun boyutu
                    horizontal: 25,
                    vertical: 120,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Sign In"
                        ,style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold

                        ),
                      ),
                      SizedBox(height: 50), //sign in yazısı ile email kutucuğu arasındaki boşluk
                      buildEmail(),
                      SizedBox(height: 20,), //email ve password kutucuğu arasındaki boşluk.
                      buildPassword(),
                      buildForgotPassword(),
                      buildRemember(),
                      buildLoginButon(),
                      buildSignUpButon(),

                    ],
                  ),
                ),
              ) ,
            ],
          ),
        ),
      ),

    );

  }

}




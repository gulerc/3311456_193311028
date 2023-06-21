import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:haber_uygulamasi/Pages/LoginPage.dart';


class SifremiUnuttum extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,// ekran klavyesi açıldığında yeniden boyutlandırma
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,),
        ), systemOverlayStyle: SystemUiOverlayStyle.dark,
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
                  Text("Şifremi Unuttum",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,

                    ),),
                  SizedBox(height: 20,),
                  Text("Şifre Sıfırlama Maili gönder.",
                    style: TextStyle(
                        fontSize: 15,
                        color:Colors.grey[700]),)
                ],
              ),
              Column(
                children: <Widget>[
                  inputFile(label: "E-Mail"),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 1, left: 1),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {Navigator.push(context, MaterialPageRoute( builder:(context)=> LoginPage()));},
                  color: Colors.red,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),

                  ),
                  child: Text(
                    "Gönder", style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.white,

                  ),
                  ),

                ),
              ),
            ],
          ),
        ),),);
  }
}



// we will be creating a widget for text field
Widget inputFile({label, obscureText = false})
{
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color:Colors.black87
        ),

      ),
      SizedBox(
        height: 5,
      ),
      TextField(

        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0,// dikey ve yatay ayarlama
                horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.grey
              ),

            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)
            )
        ),
      ),
      SizedBox(height: 10,)
    ],
  );
}

import 'package:flutter/material.dart';

class SonDakika extends StatefulWidget {
  const SonDakika({Key? key}) : super(key: key);

  @override
  State<SonDakika> createState() => _SonDakikaState();
}

class _SonDakikaState extends State<SonDakika> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
centerTitle: true,
        title: Text(
          "Son Dakika",
          style: TextStyle(color: Colors.black),
        ),
        brightness: Brightness.light,
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
      ),
    );
  }
}

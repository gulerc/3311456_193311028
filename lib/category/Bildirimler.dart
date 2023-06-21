import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Bildirimler extends StatefulWidget {
  const Bildirimler({Key? key}) : super(key: key);

  @override
  State<Bildirimler> createState() => _BildirimlerState();
}

class _BildirimlerState extends State<Bildirimler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Bildirimler",
          style: TextStyle(color: Colors.black),
        ),
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
        ), systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
    );
  }
}

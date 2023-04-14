import 'package:flutter/material.dart';
class YurtHaber extends StatefulWidget {
  const YurtHaber({Key? key}) : super(key: key);

  @override
  State<YurtHaber> createState() => _YurtHaberState();
}

class _YurtHaberState extends State<YurtHaber> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Yurt Haber",
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

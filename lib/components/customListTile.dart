import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/article_model.dart';

Widget CustomListTile(Article article) {
  return Container(
    margin: EdgeInsets.all(12.0),
    padding: EdgeInsets.all(8.0),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.0),
        boxShadow: [BoxShadow(color: Colors.black, blurRadius: 3.0)]),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        SizedBox(height: 8.0,),
        Text(article.author,style: TextStyle(fontWeight: FontWeight.w900),),
        SizedBox(height: 8.0,),
        Text(article.title,)
      ],
    ),
  );
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:haber_uygulamasi/components/customListTile.dart';
import 'package:haber_uygulamasi/services/api_service.dart';
import 'package:http/http.dart'as http;
import '../model/article_model.dart';

class Gundem extends StatefulWidget {
  const Gundem({Key? key}) : super(key: key);

  @override
  State<Gundem> createState() => _GundemState();
}
class ApiService {

  Future<List<Article>> getArticle() async {
    var uri= Uri.parse("https://newsapi.org/v2/top-headlines?country=tr&category=general&apiKey=016bfc86c5c546b6b5265fdb9b8c612f");
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);

      List<dynamic> body = json["articles"];

      List<Article> articles = body.map((dynamic e) => Article.fromJson(e)).toList();
      return articles;
    }
    else {
      throw ("Ulaşılamadı.");
    }
  }
}
class _GundemState extends State<Gundem> {
  ApiService newsApi = ApiService();

  get boolTrue => null;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [

          FutureBuilder(
              future: newsApi.getArticle(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Article>> snapshot) {
                if (snapshot.hasData) {
                  List<Article>? articles = snapshot.data;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: articles?.length,
                      itemBuilder: (context, index) => CustomListTile(articles![index])
                    ),
                  );
                }
                return Center(
                    child: CircularProgressIndicator());
              }),
        ],
      ),
    );
  }
}

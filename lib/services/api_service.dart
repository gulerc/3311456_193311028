import 'dart:convert';

import 'package:haber_uygulamasi/model/article_model.dart';
import 'package:http/http.dart'as http;

class ApiService {

  Future<List<Article>> getArticle() async {
    var uri= Uri.parse("https://newsapi.org/v2/top-headlines?country=tr&apiKey=016bfc86c5c546b6b5265fdb9b8c612f");
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

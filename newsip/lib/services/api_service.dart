import 'dart:convert';

import 'package:http/http.dart';
import 'package:newsip/model/article_model.dart';

class ApiService{
final endPointUrl =
"https://newsapi.org/v2/everything?q=tesla&from=2021-04-20&sortBy=publishedAt&apiKey=3947d865affd4e57a6ec0a7564afea76";

Future<List<Article>> getArticle() async{
  Response res = await get(endPointUrl);

  if(res.statusCode == 200){
    Map<String, dynamic> json = jsonDecode(res.body);

    List<dynamic> body = json['articles'];

    List<Article> articles = body.map((dynamic item) => Article.fromJson(item)).toList();

    return articles;
  }else{
    throw("can't get the Article");
  }
}

}
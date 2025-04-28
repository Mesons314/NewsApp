import 'dart:convert';

import 'package:newsapp/model/article_model.dart';
import 'package:http/http.dart' as http;
class News{
  List<ArticleModel> news = [];
  Future<void> getNews()async {
    String? url = "https://newsapi.org/v2/everything?q=tesla&from=2025-04-20&sortBy=publishedAt&apiKey=e34650a65a9241d7922e8e08ef1b18ea";
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);
    print('API response status: ${jsonData['status']}');
    print('Total articles fetched: ${jsonData['articles']?.length}');
    print('Error: ${jsonData['message']}');

    if(jsonData['status'] == 'ok'){
      jsonData['articles'].forEach((element) async {
        if(element['urlToImage'] != null && await isImageAccessible(element['urlToImage'])){
          ArticleModel articleModel = ArticleModel.fromJson(element);
          news.add(articleModel);
        }
      });
    }
  }

  Future<bool> isImageAccessible(String imageUrl) async{
    try{
      var response = await http.head(Uri.parse(imageUrl));
      return response.statusCode == 200;
    }catch(e){
      return false;
    }
  }
}

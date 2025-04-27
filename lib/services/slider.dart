import 'dart:convert';

import 'package:newsapp/model/SliderModel.dart';
import 'package:http/http.dart' as http;
class Sliders{
  List<SliderModel> sliders = [];
  Future<void> getSliders()async {
    String? url = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=e34650a65a9241d7922e8e08ef1b18ea";
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);
    print('API response status: ${jsonData['status']}');
    print('Total articles fetched: ${jsonData['articles']?.length}');
    print('Error: ${jsonData['message']}');

    if(jsonData['status'] == 'ok'){
      jsonData['articles'].forEach((element) async {
        if(element['urlToImage'] != null && await isImageAccessible(element['urlToImage'])){
          SliderModel sliderModel = SliderModel.fromJson(element);
          sliders.add(sliderModel);
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
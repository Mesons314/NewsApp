import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/model/article_model.dart';
import 'package:newsapp/services/news.dart';

class TrendingNews extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return trendingNews();
  }
}

class trendingNews extends State<TrendingNews>{

  List<ArticleModel> articles= [];
  bool isLoaded = true;

  @override
  void initState(){
    super.initState();
    getNews();
  }

  getNews() async{
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      isLoaded = false;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trending News'),
      ),
      body: isLoaded? Center(child: CircularProgressIndicator(),):
          Container(
            child: ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context,index){
              return Container(
                padding: EdgeInsets.only(bottom: 10,left: 5,right: 5),
                child: Material(
                  borderRadius: BorderRadius.circular(12),
                  elevation: 3,
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                      height: MediaQuery.of(context).size.height/3.0,
                      width: MediaQuery.of(context).size.width/1.9,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 6),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: CachedNetworkImage(
                                  imageUrl: articles[index].urlToImage!,
                                  height: 165,
                                width: MediaQuery.of(context).size.width/0.9,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 6),
                            width: MediaQuery.of(context).size.width/0.9,
                            child: Text(articles[index].title!,
                            maxLines: 2,
                            style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 3),
                            width: MediaQuery.of(context).size.width/0.9,
                            child: Text(articles[index].description!,
                            maxLines: 3,
                            style: TextStyle(fontSize: 12),),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          )
    );
  }
}
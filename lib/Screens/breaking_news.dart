import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/model/article_model.dart';
import 'package:newsapp/services/news.dart';

class BreakingNews extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return breakingNews();
  }
}

class breakingNews extends State<BreakingNews> {
  List<ArticleModel> articles = [];
  bool _loading = true;  // Loading flag to show the progress indicator

  @override
  void initState() {
    super.initState();
    getNews();
  }

  // Fetch the news articles and update the state
  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    print("Fetched Articles: ${newsClass.news}");  // Log the fetched data

    setState(() {
        // Update the articles list
      _loading = false;  // Set loading to false once data is fetched
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Breaking News'),
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator())  // Show loading indicator while fetching data
          : articles.isEmpty
          ? Center(child: Text("No articles available"))  // Show message if articles are empty
          : ListView.builder(

        itemCount: articles.length,  // Properly pass itemCount
        itemBuilder: (context, index) {
          var article = articles[index];
          String image = article.urlToImage ?? '';  // Provide a fallback value
          String title = article.title ?? 'No Title';  // Provide a fallback title
          return buildImage(image, index, title);
        },
      ),
    );
  }

  Widget buildImage(String image, int index, String name) => InkWell(
    child: Container(
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              height: 250,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width, imageUrl: image,
            ),
          ),
          Container(
            height: 80,
            margin: const EdgeInsets.only(top: 170),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.black26,
                borderRadius: BorderRadius.circular(12)),
            child: Center(
              child: Text(
                name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

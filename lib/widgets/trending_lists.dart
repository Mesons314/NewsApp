
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/Screens/articles_screen.dart';

class BlogTile extends StatelessWidget{
  final String urlToImage, title,url;
  BlogTile({required this.title,required this.urlToImage,required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> ArticleView(blogUrl: url)));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Material(
            borderRadius: BorderRadius.circular(12),
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: CachedNetworkImage(
                          imageUrl: urlToImage,
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 6),
                        width: MediaQuery.of(context).size.width/1.9,
                        child: Text(
                          title,
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width/1.9,
                        padding: EdgeInsets.only(left: 6),
                        child: Text('',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
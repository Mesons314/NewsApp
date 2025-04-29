
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/Screens/articles_screen.dart';

class BlogTile extends StatelessWidget{
  final String urlToImage, title,url;
  BlogTile({required this.title,required this.urlToImage,required this.url});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double screenWidth = size.width;
    double screenHeight = size.height;
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
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: CachedNetworkImage(
                          imageUrl: urlToImage,
                          height: 155,
                          width: screenWidth * 0.35,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 6),
                    width: screenWidth * 0.55,
                    child: Text(
                      title,
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
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
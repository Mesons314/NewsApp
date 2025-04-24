
class ArticleModel{
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? content;


  ArticleModel({this.author, this.title, this.description, this.url,
      this.urlToImage, this.content});

  factory ArticleModel.fromJson(Map<String,dynamic> json){
    return ArticleModel(
      title: json['title'],
      author: json['author'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      content: json['content']
    );
  }
}
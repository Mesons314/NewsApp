class CategoryModel1{
  String? categoryName;
  String? image;
  String? author;
  String? title;
  String? description;
  String? url;
  String? content;
  String? urlToImage;

  CategoryModel1({
   this.url,this.title,this.urlToImage,this.content,this.author,this.description
});

  factory CategoryModel1.fromJson(Map<String,dynamic> json){
    return CategoryModel1(
      title: json['title'],
        description: json['description'],
        author: json['author'],
        urlToImage: json['urlToImage'],
        url: json['url'],
        content: json['content']
    );
  }
}
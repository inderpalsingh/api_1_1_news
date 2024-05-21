class NewsModel {
  String? author;
  String? title;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;
  SourceModel? source;

  NewsModel({
      required this.author,
      required this.title,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      required this.content,
      required this.source
   });

  factory NewsModel.fromJson(Map<String, dynamic> json){
    return NewsModel(
        author: json['author'],
        title: json['title'],
        url: json['url'],
        urlToImage: json['urlToImage'],
        publishedAt: json['publishedAt'],
        content: json['content'],
        source: SourceModel.fromJson(json['source'])
    );
  }
}





class SourceModel{
  String? id;
  String? name;

  SourceModel({required this.id, required this.name});

  factory SourceModel.fromJson(Map<String, dynamic> sourceJson){
    return SourceModel(
        id: sourceJson['id'],
        name: sourceJson['name']
    );
  }

}
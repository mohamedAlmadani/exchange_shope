class News{
  String imageUrl;
  String Name;
  String description;
  String newsId;
  News({this.Name,this.description,this.imageUrl,this.newsId});
  News.fromMap(Map map){
    this.imageUrl=map['imageUrl'];
    this.description=map['newsDescription'];
    this.Name=map['newsName'];
    this.newsId=map['newsId'];

  }
}
import 'dart:convert';
List<images> imagesFromJson(String str) =>
    List<images>.from(json.decode(str).map((x) => images.fromMap(x)));
String productToJson(List<images> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class images {
  String id;
  String author;
  String url;
  images({this.url,this.id,this.author});
  toMap()=>{
    'id':id,
    'author':author,
    'download_url':url,
  };
  images.fromMap(Map <String,dynamic>map):
        url=map['download_url'],
        author=map['author'],
        id=map['id'];
}
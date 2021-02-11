import 'dart:convert';

List<images>imagesFromJson(String str)=>List<images>.from(jsonDecode(str).map((x)=>images.fromMap(x)));
String prductTojson(List<images>data)=>jsonEncode(List<dynamic>.from(data.map((x) => x.toMap())));


class images{

  String id;
  String author;
  String url;

  images(this.id, this.author, this.url);
  toMap()=>{
    'id':id,
    'author':author,
    'download_url':url,
  };
  images.fromMap(Map<String,dynamic>map):
      url=map['download_url'],
      author=map['author'],
     id=map['id'];



}

import 'package:http/http.dart' as http;
import 'package:task1/Model/imgaes.dart';

class RemoteServices {
  static var client = http.Client();
  static Future<List<images>> fetchProducts(int page,int items) async {
    String url='https://picsum.photos/v2/list?page=$page+&limit='+items.toString();
    print(url);
    var response = await client.get(url);
    if (response.statusCode == 200) {
      print(response.statusCode);
      var jsonString = response.body;
      print(jsonString);
      return imagesFromJson(jsonString);
    }
    else {
      return null;
    }
  }

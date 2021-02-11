import 'package:http/http.dart' as http;
import 'Model/imgaes.dart';
class RemoteServices{
  static var client = http.Client();
  static Future<List<images>>fetchProducts(int items) async {

    String url="https://picsum.photos/v2/list?page=2&limit="+items.toString;
    var response= await client.get(url);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return imagesFormJson(jsonString);
    } else {
      return null;
    }
  }
  }

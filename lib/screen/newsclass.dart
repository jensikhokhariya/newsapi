import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:newsapi/screen/model.dart';
class NewsData {
  Future<Status> getnewsData(String name) async {
    String linknews =
        "https://newsapi.org/v2/top-headlines?country=us&category=$name&apiKey=51a05f525a0a47a3afe216d5e520524a";
    Uri uri = Uri.parse(linknews);
    var res = await http.get(uri);
    var v1 = jsonDecode(res.body);

    return Status().NewsFactory(v1);
  }
}

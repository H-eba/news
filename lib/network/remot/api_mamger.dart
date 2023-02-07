import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled/network/remot/NewsResponse.dart';
//import 'package:untitled/models/TabsResponce.dart';
import 'package:untitled/network/remot/TabsResponce.dart';
class ApiManager {
  static String baseurl = 'https://newsapi.org';
  static String apiKey = 'e15961797e3a4536a10ca4b2842a96ca';

  static Future<TabsResponce> getTabs() async {
    var response = await http.get(
        Uri.parse('${baseurl}/v2/top-headlines/sources?apiKey=${apiKey}'));
    String jsonBody = response.body;
    var json = jsonDecode(jsonBody);
    TabsResponce tabsResponse = TabsResponce.fromJson(json);
    return tabsResponse;
  }

  static Future<NewsResponse> getNews( String sourceId) async {
    var response = await http.get(Uri.parse(
        '$baseurl/v2/everything?apiKey=$apiKey=$sourceId'));
    String jsonBody = response.body;
    var json = jsonDecode(jsonBody);
    //print(tap.);
    /// tarn body from string to map or json to enter in model class
    NewsResponse newsResponse = NewsResponse.fromJson(json);
    /// NewsResponse is a class to tarn response to json
    return newsResponse;
  }
}
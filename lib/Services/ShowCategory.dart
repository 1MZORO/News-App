import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/ShowCategoryModels.dart';
class ShowCategory{
  List<ShowCategoryModels> showCategory = [];

  Future<void> getCategoryNews(String category)async{
    String url = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=6fadeb88183d46e69b38f31d4d8782ad";

    try{

      http.Response response = await http.get(Uri.parse(url));
      var jsonData = jsonDecode(response.body);

      if(jsonData['status']=='ok'){
        print("IMP :::::");
        print(jsonData['status'=='ok']);
        jsonData['articles'].forEach((element){
          if(element['urlToImage'] != null && element['description'] != null){
            ShowCategoryModels categoryModel = ShowCategoryModels(
                title: element['title'],
                dis: element['description'],
                urlToImage: element['urlToImage']
            );
            showCategory.add(categoryModel);
          }
        });
      }} catch(e){
      print("Error :: ${e.toString()}");
    }
  }
}

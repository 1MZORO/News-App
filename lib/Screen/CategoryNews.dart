import 'package:flutter/material.dart';
import '../Models/ShowCategoryModels.dart';
import '../Services/ShowCategory.dart';

class CategoryNews extends StatefulWidget {
  final String? name;
  const CategoryNews({super.key, required this.name});

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ShowCategoryModels> category = [];
  bool isLoading = false;

  getNews()async{
    ShowCategory showCategoryNews = ShowCategory();
    await showCategoryNews.getCategoryNews(widget.name!.toLowerCase());
    category = showCategoryNews.showCategory;
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff3280ef),
        body: Container(
          margin: EdgeInsets.only(top: 40,),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 14,),
                    child: Icon(Icons.arrow_back_ios_rounded,color: Colors.white,),
                  ),
                    SizedBox(width: 120,),
                    Text("Business",style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30
                    ),)
                ],
              ),
              SizedBox(height: 20,),
              Expanded(
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)
                    )
                  ),
                ),
              )
            ],
          ),
        ),
    );
  }
}

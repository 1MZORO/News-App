import 'package:flutter/material.dart';
import 'package:news_app/Models/CategoryModel.dart';
import 'package:news_app/Screen/CategoryNews.dart';
import 'package:news_app/Services/Data.dart';
import 'package:news_app/Services/News.dart';

import '../Models/ArticleModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> categories = [];
  List<ArticleModel> articles = [];
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    categories = getCategories();
    getNews();
    super.initState();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color.fromARGB(244, 255, 255, 255),
      body: Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'TIME ',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                Text(
                  'NEWS',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Hottest News',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontSize: 26),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 301,
              child: ListView.builder(
                physics: ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: articles.length,
                itemBuilder: (BuildContext context, int index) {

                  return Container(
                    margin: EdgeInsets.only(right: 20),
                    child: Material(
                      elevation: 3,
                      borderRadius: BorderRadius.circular(15),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, left: 10),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15))),
                          child: Column(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Image.network(
                                      articles[index].urlToImage!,
                                      errorBuilder: (context, error, stackTrace) {
                                        return Icon(Icons.broken_image, size: 100, color: Colors.grey);
                                      },
                                      fit: BoxFit.cover,
                                      height: 150,
                                      width: size.width / 1.8,
                                    ),
                                  )),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: size.width / 1.8,
                                child: Text(
                                  articles[index].title!,
                                  maxLines: 2,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 19),
                                ),
                              ),
                              Container(
                                width: size.width / 1.8,
                                child: Text(
                                  articles[index].dis!,
                                  maxLines: 2,
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15),
                                ),
                              ),
                              Container(
                                height: 40,
                                width: 89,
                                margin: EdgeInsets.only(left: 170),
                                decoration: BoxDecoration(
                                    color: Color(0xff3280ef),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20))),
                                child: Icon(
                                  Icons.arrow_forward_outlined,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Explore',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 26),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 150,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    // print("Category :: ${categories[index].categoryName}");
                    // print("Images :: ${categories[index].image}");
                    return CategoryTile(
                      image: categories[index].image,
                      categoty: categories[index].categoryName,
                    );
                  }),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Treading News',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 26),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.white,
              child: Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15)),
                      child: Image.asset(
                        'assets/img/news2.jpg',
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                      )),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        width: size.width / 1.8,
                        child: Text(
                          'I am an flutter app developer i am creating an news app ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                              fontSize: 19),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: size.width / 1.8,
                        child: Text(
                          'I am an flutter app developer i am creating an news app ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w400,
                              fontSize: 15),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final image, categoty;
  const CategoryTile({super.key, required this.image, required this.categoty});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (_)=>CategoryNews(name: categoty)));
      },
      child: Container(
        margin: EdgeInsets.only(right: 20),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(60),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Image.asset(
                  image,
                  height: 120,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(60),
              ),
            ),
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
              ),
              child: Center(
                child: Text(
                  categoty,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}

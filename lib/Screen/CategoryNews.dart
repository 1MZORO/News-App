import 'package:flutter/material.dart';
import 'package:news_app/Screen/ArticleView.dart';
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

  getNews() async {
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
        margin: EdgeInsets.only(
          top: 40,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 14,
                  ),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width*.26,
                ),
                Text(
                  widget.name!,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                height: size.height,
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: category.length,
                    itemBuilder: (context, index) {
                      return CategoryTile(
                        image: category[index].urlToImage!,
                        title: category[index].title!,
                        dis: category[index].dis!,
                        url: category[index].url!,
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
class CategoryTile extends StatelessWidget {
  final String image, title, dis,url;
  const CategoryTile({super.key, required this.image, required this.title, required this.dis, required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        // Navigator.push(context, MaterialPageRoute(builder: (_)=>ArticleView(blogUrl: url)));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8), // Adjusted spacing
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                image,
                height: 250, // Adjust height
                width: double.infinity, // Fill the available width
                fit: BoxFit.cover, // Prevent image overflow
              ),
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              dis,
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(244, 255 , 255, 255),
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
                      fontWeight: FontWeight.w500,
                      fontSize: 23),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 330,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Material(
                  elevation: 3,
                  borderRadius: BorderRadius.circular(15),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10,left: 10),
                    child: Container(
                      decoration: BoxDecoration(color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15))
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Image.asset(
                                  'assets/img/news1.jpg',
                                  fit: BoxFit.cover,
                                  height: 150,
                                  width: size.width / 1.8,
                                ),
                              )),
                          SizedBox(height: 5,),
                          Container(
                            width: size.width / 1.8,
                            child: Text(
                              'I am an flutter app developer i am creating an news app ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 19),
                            ),
                          ),
                          Container(
                            width: size.width / 1.8,
                            child: Text(
                              'I am an flutter app developer i am creating an news app ',
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
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(20))
                            ),
                            child: Icon(Icons.arrow_forward_outlined,size: 30,color: Colors.white,),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                  SizedBox(height: 10,width: 10,),
                  Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular(15),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10,left: 10),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.white,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(15))
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Image.asset(
                                    'assets/img/news1.jpg',
                                    fit: BoxFit.cover,
                                    height: 150,
                                    width: size.width / 1.8,
                                  ),
                                )),
                            SizedBox(height: 5,),
                            Container(
                              width: size.width / 1.8,
                              child: Text(
                                'I am an flutter app developer i am creating an news app ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 19),
                              ),
                            ),
                            Container(
                              width: size.width / 1.8,
                              child: Text(
                                'I am an flutter app developer i am creating an news app ',
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
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20))
                              ),
                              child: Icon(Icons.arrow_forward_outlined,size: 30,color: Colors.white,),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:news_app/Screen/Home.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              'assets/img/onboard.jpg',
              fit: BoxFit.cover,
              height: size.height / 1.7,
              width: size.width,
            ),
            Container(
              margin: EdgeInsets.only(top: size.height / 1.8),
              width: size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              child: Column(children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Get The Latest And Updated \nNews From The App',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 30,
                ),
                Image.asset(
                  'assets/img/newspaper.png',
                  fit: BoxFit.cover,
                  height: size.height * .12,
                  width: size.width * .3,
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>HomeScreen()));
                },style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                  padding: EdgeInsets.symmetric(vertical: 12),
                  textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  minimumSize: Size(360, 50),
                ), child: Text('Get Started',style: TextStyle(fontSize: 24),),)
              ]),
            )
          ],
        ),
      ),
    );
  }
}

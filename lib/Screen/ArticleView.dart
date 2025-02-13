// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// class ArticleView extends StatefulWidget {
//   String blogUrl;
//   ArticleView({super.key ,required this.blogUrl});
//
//   @override
//   State<ArticleView> createState() => _ArticleViewState();
// }
//
// class _ArticleViewState extends State<ArticleView> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           actions: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   'TIME ',
//                   style: TextStyle(
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.blue),
//                 ),
//                 Text(
//                   'NEWS',
//                   style: TextStyle(
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       body: WebView(
//         initialUrl: 'https://flutter.dev/',
//         javascriptMode: JavascriptMode.unrestricted,
//       ),
//     );
//   }
// }

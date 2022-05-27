import 'package:flutter/material.dart';
import 'package:newstragram/di/providers.dart';
import 'package:newstragram/models/db/database.dart';
import 'package:newstragram/style/style.dart';
import 'package:newstragram/view/screens/home_screen.dart';
import 'package:newstragram/viewmodels/head_line_viewmodel.dart';
import 'package:newstragram/viewmodels/news_list_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: globalProviders,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Newstagram',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: BoldFont,
      ),
      home: HomeScreen(),
    );
  }
}

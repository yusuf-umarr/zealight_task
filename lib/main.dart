import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zealight_task/feature/home/screen/homepage.dart';
import 'package:zealight_task/feature/home/view_model/home_view_model.dart';

void main() {
  runApp(MultiProvider(
    providers: [
       ChangeNotifierProvider(
          create: (context) => HomeViewModel(),
        ),

    ],
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zealight Task',
      theme: ThemeData(
    
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Homepage(),
    );
  }
}


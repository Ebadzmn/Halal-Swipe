import 'package:flutter/material.dart';
import 'package:halal_swipe/routes/app_pages.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Halal Swipes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Inter',
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF941235),
          primary: const Color(0xFF941235),
        ),
      ),
      initialRoute: AppPages.initial,
      onGenerateRoute: AppPages.onGenerateRoute,
    );
  }
}

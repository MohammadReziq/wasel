import 'package:flutter/material.dart';
import 'package:frontend_flutter/app/core/theme/app_theme.dart';
import 'package:frontend_flutter/app/routes/app_pages.dart';
import 'package:frontend_flutter/app/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase
  await Firebase.initializeApp();
  
  runApp(MyApp(initalRoute: AppRoutes.initial));
}

class MyApp extends StatelessWidget {
  final String initalRoute;
  MyApp({super.key, required this.initalRoute});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'قُرب',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: AppRoutes.splashScreen,
      getPages: AppPages.routes,
    );
  }
}

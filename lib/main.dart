import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kgiantinsight/resources/app_colors.dart';
import 'package:kgiantinsight/views/SalesAnalysisView.dart';
import 'package:kgiantinsight/views/gridView.dart';
import 'package:kgiantinsight/views/insightView.dart';
import 'package:kgiantinsight/views/loginView.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mobile K-Giant',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        useMaterial3: true,
      ),
      home: const LoginView(),
      routes: {
        '/login': (context) => const LoginView(),
        '/chart': (context) => const InSightView(),
        '/grid': (context) => const GridViewScreen(),
        '/sales': (context) => const SalesAnalysisView(),
      },
    );
  }
}

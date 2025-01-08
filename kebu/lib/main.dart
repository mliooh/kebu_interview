import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kebu/pages/homepage.dart';
import 'package:kebu/pages/login.dart';
import 'package:kebu/services/apiservices.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  final ApiService apiService = ApiService();
  
  Future<Widget> _getInitialPage() async {
    final accessToken = await apiService.getAccessToken();

    // If there's no token, redirect to login
    if (accessToken == null) return Login();

    // Attempt to refresh the token
    final response = await apiService.refreshAccessToken();
    if (response != null) {
      await apiService.saveTokens(response['access_token'], response['refresh_token']);
      return Homepage();
    }

    return Login();
  }

   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Widget>(
      
      future: _getInitialPage(),
      builder: (context, snapshot) {
        
        if (snapshot.connectionState == ConnectionState.waiting) {
          return ScreenUtilInit(
          designSize: Size(375, 812),
    builder: (context, child) {
          return
            const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
          );
        });}
        return MaterialApp(debugShowCheckedModeBanner: false,
          home: //Homepage()
          snapshot.data ?? Login(),
        );
      },
    );
  }
}

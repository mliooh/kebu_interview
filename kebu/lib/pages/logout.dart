import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kebu/pages/login.dart';
import 'package:kebu/widgets/my_button.dart';

class Logout extends StatelessWidget {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

   //Logout
  Future<void> logout(BuildContext context) async {
    await _storage.delete(key: 'access_token');
    await _storage.delete(key: 'refresh_token');

    // Navigate to the login page and remove all previous routes
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => Login()), 
      (route) => false,
    );
  }
   Logout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFFFA016),
        centerTitle: true,
        title: Text(
          "Kebu",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20.sp),
        ),
      ),
      body:  Center(
          child: SingleChildScrollView(
              child: Column(
        children: [
          MyButton(text: "logout", onTap: () async{
            await logout(context);
          }, )
        ],
      ))),
    );
  }
}

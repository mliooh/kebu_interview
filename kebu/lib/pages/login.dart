import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kebu/pages/homepage.dart';
import 'package:kebu/pages/signup.dart';
import 'package:kebu/services/apiservices.dart';
import 'package:kebu/widgets/custom_textfield.dart';
import 'package:kebu/widgets/my_button.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // textedditing controllers for password and phone fields

  String? phoneerror;
  String? passworderror;
  final TextEditingController phonecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final ApiService apiService = ApiService();
  

// textfield validation for phone number and password

  void passwordLength(String value) {
   String? error;
    if (value.isEmpty) {
      
       error = "Password is required";
      
    } else if (value.length < 8 || value.length > 15) {
      
        error = "Password must be between 8 and 15 characters";
      
    } else {
      setState(() {
        passworderror = null;
      });
    }
      setState(() {
    passworderror = error; // Updates the error in a single setState call.
  });
    
  }

  void validatePhone(String value) {
    if (value.isEmpty) {
      setState(() {
        phoneerror = "Phone number is required";
      });
    } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
      setState(() {
        phoneerror = "Enter a valid 10-digit phone number";
      });
    } else {
      setState(() {
        phoneerror = null;
      });
    }
  }
String? _errorMessage;
bool _isLoading = false;

  Future<void> _login() async {
    final username = phonecontroller.text.trim();
    final password = passwordcontroller.text.trim();

    if (username.isEmpty || password.isEmpty) {
      setState(() {
        _errorMessage = 'Username and password are required.';
      });
      return;
    }
  

  setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final tokens = await apiService.authenticate(username, password);
      if (tokens != null) {
        // Save tokens and navigate to the home page
        await apiService.saveTokens(tokens['access_token'], tokens['refresh_token']);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Homepage()),
        );
      } else {
        setState(() {
          _errorMessage = 'Login failed. Please check your credentials.';
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'An error occurred. Please try again.';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                // salutation

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Shipping and Track Anytime",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Get great experience with tracky",
                      style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                    ),
                  ],
                ),
                SizedBox(
                  height: 60.h,
                ),
                // phone  number field
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Phone Number",
                      style: TextStyle(color: Colors.black, fontSize: 20.sp),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextfield(
                  text: 'Enter your number',
                  obscureText: false,
                  icon: Icon(Icons.phone),
                  errorText: phoneerror,
                  keyboardtype: TextInputType.phone,
                  controller: phonecontroller,
                ),
                SizedBox(
                  height: 10.h,
                ),
                // password  field
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Password",
                      style: TextStyle(color: Colors.black, fontSize: 18.sp),
                    ),
                  ],
                ),
                CustomTextfield(
                  text: 'Enter your password',
                  controller: passwordcontroller,
                  obscureText: true,
                  icon: Icon(Icons.lock),
                  errorText: '',
                  keyboardtype: TextInputType.visiblePassword,
                ),
                SizedBox(
                  height: 40.h,
                ),

                // login button
                 Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    if (_errorMessage != null) ...[
      Text(
        _errorMessage!,
        style: TextStyle(color: Colors.red, fontSize: 14),
      ),
      SizedBox(height: 10),
    ],
    MyButton(
      text: _isLoading ? "Logging in..." : "Log In", // Dynamically update text
      onTap: _isLoading ? null : _login, // Disable the button when loading
    ),
  ],
),

                SizedBox(
                  height: 30.h,
                ),

                // sign up button

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Divider(
                    color: Colors.grey.shade200,
                    thickness: 3,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Dont have an account yet?',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => Signup()));
                      },
                      child: Text(
                        'Signup',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

// dispossing TextEditingController

  @override
  void dispose() {
    phonecontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }
}

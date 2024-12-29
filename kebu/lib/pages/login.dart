import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kebu/pages/signup.dart';
import 'package:kebu/widgets/custom_textfield.dart';
import 'package:kebu/widgets/my_button.dart';

class Login extends StatelessWidget {
  final TextEditingController _emailController =TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
   Login({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
            // salutation 
            
            Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Shipping and Track Anytime", style: TextStyle(color: Colors.black, fontSize: 20.sp,fontWeight: FontWeight.bold),),
              ],
            ),
            SizedBox(height: 5.h,),
            Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Get great experience with tracky", style: TextStyle(color: Colors.grey, fontSize: 14.sp),),
              ],
            ),
            SizedBox(height: 60.h,),
            // phone  number field
            Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Phone Number", style: TextStyle(color: Colors.black, fontSize: 20.sp),),
              ],
            ),
            SizedBox(height: 10.h,),
            CustomTextfield(text: 'Enter your number', controller: _emailController, obscureText: false, icon: Icon(Icons.phone),),
            SizedBox(height: 10.h,),
            // password  field
            Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Password", style: TextStyle(color: Colors.black, fontSize: 18.sp),),
              ],
            ),
            CustomTextfield(text: 'Enter your password', controller: _passwordcontroller, obscureText: true, icon: Icon(Icons.lock),),
            SizedBox(height: 40.h,),
            
            // login button
            MyButton(text: "Log In"),
            SizedBox(height: 30.h,),


            // sign up button   

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Divider(color: Colors.grey.shade200, thickness: 3, ),
            ),
 SizedBox(height: 20.h,),
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
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
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
}
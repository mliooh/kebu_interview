import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kebu/pages/commingsoon.dart';

class Mycard extends StatelessWidget {
  final String text;
  final Icon icon;
  const Mycard({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: GestureDetector(onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Commingsoon()) );},
        child: Container(
          height: 80.h,
          width: 90.w,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.orange),
          child: Column(mainAxisAlignment:  MainAxisAlignment.center,
            children: [icon, 
            Text(text, style: TextStyle(color: Colors.black),)],),
        ),
      ),
    );
  }
}
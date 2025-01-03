import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Commingsoon extends StatelessWidget {
  const Commingsoon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Color(0xFFFFA016),centerTitle: true,
        title: Text("Kebu", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 20.sp),),),

        body: Center(child: SingleChildScrollView(child: Column(children: [Image.asset("lib/assets/coming-soon_14178113.gif", height: 125.h, width: 125.w,)],))),
    );
  }
}
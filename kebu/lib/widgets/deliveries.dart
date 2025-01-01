import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kebu/pages/commingsoon.dart';

class DeliveriesCard extends StatelessWidget {
  final String title;
  final String text;
  final String time;
  final String amount;

  const DeliveriesCard(
      {super.key,
      required this.title,
      required this.text,
      required this.time,
      required this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(20)),
      //height: 60.h,
     // width: 90.w,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // shop name
                  Row(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                      // item description
                  Text(
                    text,
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 14.sp),
                  ),
                      
                  // amount and time
                  Row(
                    children: [
                      Text(
                        amount,
                        style: TextStyle(
                            color: Colors.green, fontSize: 15.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 20.w,),
                      Text(time, style: TextStyle(color: Colors.grey.shade600, fontSize: 15.sp),)
                    ],
                  )
                ],
              ),
            ),
        
            // image
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Container(
                    height: 60.h,width: 60.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.shade600),
                    child: Icon(Icons.gif_box, color: Colors.orange, size: 18.sp,),
                  )
                ],
              ),
            )
          ],
        ),
      ),

      // item cost

      // time
    );
  }
}

class test extends StatelessWidget {
  final String title;
  final String text;
  final String time;
  final String amount;
  const test({super.key, required this.title, required this.text, required this.time, required this.amount});

  Widget build(BuildContext context) {
  return GestureDetector(onTap: () {
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Commingsoon()));
  },
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, 5),
          ),
        ],
      ),
      padding: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left Section: Text Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  text,
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Text(
                      amount,
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 15.w),
                    Text(
                      time,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Right Section: Icon
          Container(
            height: 60.h,
            width: 60.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.orange.shade50,
              //border: Border.all(color: Colors.orange, width: 1.5),
            ),
            child: Center(
              child: Image.asset("lib/assets/packageicon.png",scale: 1),
            ),
          ),
        ],
      ),
    ),
  );
}

}
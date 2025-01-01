import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kebu/pages/searchpage.dart';

import 'package:kebu/widgets/deliveries.dart';
import 'package:kebu/widgets/mycard.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,

// app bar

      appBar: AppBar(
        //backgroundColor: Colors.orange,
        elevation: 10,
        // profile pic and welcome message

        title: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(decoration: BoxDecoration(color: Colors.grey.shade500, borderRadius: BorderRadius.circular(30)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(58),
                          child: Icon(Icons.person),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        "Welcome",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  // notification icon

                  Icon(
                    Icons.notifications,
                    color: Colors.purple,
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
        //
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
// search field

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Searchpage()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40)),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Icon(Icons.search),
                            Text(
                              "Search by tracking number",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 14.sp),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                // profile picture
                // Row(),
                // cards for Order, Nearby & Help Center
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Mycard(text: "Order", icon: Icon(Icons.gif_box)),
                    Mycard(text: "History", icon: Icon(Icons.map)),
                    Mycard(
                        text: "Help Center",
                        icon: Icon(Icons.work_outline_outlined))
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                // search bar for displayed deliveries
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
                //   child: SearchBar(
                //     onTap: () {
                //       Navigator.of(context).push(MaterialPageRoute(
                //           builder: (context) => Searchpage()));
                //     },
                //     hintText: "Search by tracking number",
                //     leading: Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: Icon(
                //         Icons.search,
                //       ),
                //     ),
                //   ),
                // ),

                SizedBox(
                  height: 50,
                ),

                // recent deliveries
                test(
                    title: "ruiru kimbo",
                    text: "your delivery, #12787868686 from Nairobi",
                    time: "nov 20 2024",
                    amount: "KES 400"),

                SizedBox(
                  height: 20,
                ),

                test(
                    title: "ruiru kimbo",
                    text: "your delivery, #12787868686 from Nairobi",
                    time: "nov 20 2024",
                    amount: "KES 400"),

                SizedBox(
                  height: 20,
                ),

                test(
                    title: "ruiru kimbo",
                    text: "your delivery, #12787868686 from Nairobi",
                    time: "nov 20 2024",
                    amount: "KES 400"),

                SizedBox(
                  height: 20,
                ),

                test(
                    title: "ruiru kimbo",
                    text: "your delivery, #12787868686 from Nairobi",
                    time: "nov 20 2024",
                    amount: "KES 400"),

                SizedBox(
                  height: 20,
                ),

                test(
                    title: "ruiru kimbo",
                    text: "your delivery, #12787868686 from Nairobi",
                    time: "nov 20 2024",
                    amount: "KES 400"),

                SizedBox(
                  height: 20,
                ),

                test(
                    title: "ruiru kimbo",
                    text: "your delivery, #12787868686 from Nairobi",
                    time: "nov 20 2024",
                    amount: "KES 400"),

                SizedBox(
                  height: 20,
                ),
                test(
                    title: "ruiru kimbo",
                    text: "your delivery, #12787868686 from Nairobi",
                    time: "nov 20 2024",
                    amount: "KES 400"),

                SizedBox(
                  height: 20,
                ),
                test(
                    title: "ruiru kimbo",
                    text: "your delivery, #12787868686 from Nairobi",
                    time: "nov 20 2024",
                    amount: "KES 400"),

                SizedBox(
                  height: 20,
                ),

                // DeliveriesCard(
                //     title: "ruiru kimbo",
                //     text: "your delivery, #12787868686 from Nairobi",
                //     time: "nov 20, 2024",
                //     amount: "KES 300")
              ],
            ),
          ),
        ),
      ),
    );
  }
}

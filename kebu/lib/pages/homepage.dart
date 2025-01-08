import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kebu/pages/commingsoon.dart';
import 'package:kebu/pages/logout.dart';
import 'package:kebu/pages/searchpage.dart';

import 'package:kebu/widgets/deliveries.dart';
import 'package:kebu/widgets/mycard.dart';

class Homepage extends StatefulWidget {
  
  
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  

// current selected/active page
  int currentIndex = 0;

  // navigation pages
  final List pages = [ Home(), const Commingsoon(), Logout()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[currentIndex],
        bottomNavigationBar: BottomnNav(
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            }));
  }

  
}

/// homepage contents
class Home extends StatelessWidget {final List<test> deliveries = [
    const test(
        title: "ruiru",
        text: "your delivery, #12787868686 from Nairobi",
        time: "nov 20 2024",
        amount: "KES 400"),
    const test(
        title: "juja",
        text: "your delivery, #12787868686 from Nairobi",
        time: "nov 20 2024",
        amount: "KES 700"),
    const test(
        title: "nakuru",
        text: "your delivery, #12787868686 from Nairobi",
        time: "nov 20 2024",
        amount: "KES 1000"),
    const test(
        title: "kisumu",
        text: "your delivery, #12787868686 from Nairobi",
        time: "nov 20 2024",
        amount: "KES 2000"),
    const test(
        title: "cbd",
        text: "your delivery, #12787868686 from Nairobi",
        time: "nov 20 2024",
        amount: "KES 200"),
    const test(
        title: "altech",
        text: "your delivery, #12787868686 from Nairobi",
        time: "nov 20 2024",
        amount: "KES 500"),
    const test(
        title: "buneri",
        text: "your delivery, #12787868686 from Nairobi",
        time: "nov 20 2024",
        amount: "KES 400"),
    const test(
        title: "msa",
        text: "your delivery, #12787868686 from Nairobi",
        time: "nov 20 2024",
        amount: "KES 4000"),
  ];
   Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,

// app bar

      appBar: AppBar(
        backgroundColor: const Color(0xFFFFA016),
        //backgroundColor: Colors.orange,
        elevation: 10,
        // profile pic and welcome message

        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade500,
                          borderRadius: BorderRadius.circular(30)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(58),
                        child: const Icon(Icons.person),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      "Welcome",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),

                // notification icon

                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Commingsoon()));
                  },
                  child: Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: 20.sp,
                  ),
                )
              ],
            ),
          ],
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
                          builder: (context) =>  Searchpage(cards: deliveries, )));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40)),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            const Icon(Icons.search),
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
                    Mycard(
                        text: "Order",
                        icon: Icon(
                          Icons.gif_box,
                          size: 14.sp,
                        )),
                    Mycard(text: "History", icon: Icon(Icons.map, size: 14.sp)),
                    Mycard(
                        text: "Help Center",
                        icon: Icon(Icons.work_outline_outlined, size: 14.sp))
                  ],
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
                  height: 20.h,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Recent Deliveries",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),

                SizedBox(
                  height: 20.h,
                ),

                // recent deliveries
                ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: deliveries.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      deliveries[index],
                      const SizedBox(height: 20),
                    ],
                  );
                },
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

class BottomnNav extends StatelessWidget {
  
  final int currentIndex;
  final Function(int) onTap;
  const BottomnNav(
      {super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed, // To show all labels
      selectedItemColor: const Color(0xFFFFA016), // Highlight color
      unselectedItemColor: Colors.grey, // Default color
      showSelectedLabels: true,
      showUnselectedLabels: true,
      iconSize: 22.sp,
      selectedLabelStyle: TextStyle(fontSize: 14.sp),
      unselectedFontSize: 14.sp,
      items: [
        const BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          label: 'Home',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.local_shipping),
          label: 'Deliveries',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.help),
          label: 'Profile',
        ),
      ],
    );
  }
}

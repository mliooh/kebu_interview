import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kebu/pages/commingsoon.dart';
import 'package:kebu/pages/searchpage.dart';

import 'package:kebu/widgets/deliveries.dart';
import 'package:kebu/widgets/mycard.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
// current selected/active page
  int currentIndex = 0;

  // navigation pages
  final List pages = [const Home(), const Commingsoon(), const Commingsoon()];



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
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,

// app bar

      appBar: AppBar(
        backgroundColor: Color(0xFFFFA016),
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
                        child: Icon(Icons.person),
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

                Icon(
                  Icons.notifications,
                  color: Colors.white,
                  size: 20.sp,
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

                const SizedBox(
                  height: 40,
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

                const SizedBox(
                  height: 20,
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
      selectedItemColor: Color(0xFFFFA016), // Highlight color
      unselectedItemColor: Colors.grey, // Default color
      showSelectedLabels: true,
      showUnselectedLabels: true,
      iconSize: 22.sp,
      selectedLabelStyle: TextStyle(fontSize: 14.sp),
      unselectedFontSize: 14.sp,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_shipping),
          label: 'Deliveries',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.help),
          label: 'Profile',
        ),
      ],
    );
  }
}

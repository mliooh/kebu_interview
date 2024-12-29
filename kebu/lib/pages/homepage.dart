import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kebu/widgets/mycard.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                    // profile picture
               // Row(),
                    // cards for Order, Nearby & Help Center
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [Mycard(text: "Order", icon: Icon(Icons.gif_box)),
                  Mycard(text: "History", icon: Icon(Icons.map)),
                  Mycard(text: "Help Center", icon: Icon(Icons.work_outline_outlined))],
                ),
                 SizedBox(height: 30.h,),
                    // search bar for displayed deliveries
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: SearchBar(hintText: "Search by tracking number",  leading: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.search, ),
                      ),),
                    )
                    // recent deliveries
              ],
            ),
          ),
        ),
      ),
    );
  }
}

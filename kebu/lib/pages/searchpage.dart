import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class Searchpage extends StatelessWidget {
  const Searchpage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:
      AppBar(
        //backgroundColor: Colors.orange,
      
        leading: GestureDetector(onTap: () {
                    Navigator.of(context).pop();
                  },
          child: Icon(Icons.arrow_back,  color: Colors.black,)),
      // title: Text("Search", style: TextStyle(color: Colors.white, fontSize: 20.sp),),
      // centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(children: [ SearchBar(
                      hintText: "Search by tracking number",
                      leading: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.search,
                        ),
                      ),
                    ),],),
      ),
    );
  }
}


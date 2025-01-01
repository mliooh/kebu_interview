import 'package:flutter/material.dart';


class Searchpage extends StatelessWidget {
  const Searchpage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:
      AppBar(backgroundColor: Colors.orange,
      
        leading: GestureDetector(onTap: () {
                    Navigator.of(context).pop();
                  },
          child: Icon(Icons.arrow_back)),
      title: Padding(
        padding: const EdgeInsets.all(60.0),
        child: SearchBar(
                      hintText: "Search by tracking number",
                      leading: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.search,
                        ),
                      ),
                    ),
      ),),
    );
  }
}
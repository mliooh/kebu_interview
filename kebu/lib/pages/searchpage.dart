import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kebu/widgets/deliveries.dart';

class Searchpage extends StatefulWidget {
final List<test> cards;
  Searchpage({super.key, required this.cards});

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
   List<test> filteredCards = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    filteredCards = widget.cards;
  }

  void _filterCards(String query) {
    setState(() {
      searchQuery = query.toLowerCase();
      filteredCards = widget.cards
          .where((card) => card.title.toLowerCase().contains(searchQuery))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xFFFFA016),
        title: TextField(
          autofocus: true,
          onChanged: _filterCards,
          decoration: InputDecoration(
            hintText: 'Search deliveries...',
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white54),
          ),
          style: TextStyle(color: Colors.white, fontSize: 16.sp),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: filteredCards.isEmpty
            ? Center(
                child: Text(
                  'No results found.',
                  style: TextStyle(color: Colors.grey, fontSize: 16.sp),
                ),
              )
            : ListView.builder(
                itemCount: filteredCards.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      filteredCards[index],
                      SizedBox(height: 20.h),
                    ],
                  );
                },
              ),
      ),
    );
  }
}

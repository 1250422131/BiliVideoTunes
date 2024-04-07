import 'package:flutter/material.dart';

class MainSearch extends StatefulWidget {
  const MainSearch({super.key});

  @override
  State<StatefulWidget> createState() => _MainSearch();
}

class _MainSearch extends State<MainSearch> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  InkWell(child: const Hero(
          tag: 'main_search_icon',
          child: Icon(Icons.arrow_back),
        ),onTap: () {
          Navigator.of(context).pop();
        },),
        title: SearchBar(
          hintText: "搜索一下？",
          elevation: MaterialStateProperty.all(0),
        ),
        bottom: const PreferredSize(
          preferredSize: Size(double.infinity, 10),
          child: Divider(
            height: 0.4,
            color: Colors.grey,
          ),
        ),
      ),
      body: body,
    );
  }

  Widget body = GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    itemBuilder: (BuildContext context, int index) {

    },
  );
}

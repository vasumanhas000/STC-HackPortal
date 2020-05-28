import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';
import 'package:hackapp/constants.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: SearchBar(searchBarStyle: SearchBarStyle(
        borderRadius: BorderRadius.circular(40),
        backgroundColor: kConstantPurpleColor,
      ),),
    );
  }
}

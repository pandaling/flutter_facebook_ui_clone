import 'package:flutter/material.dart';
import 'package:flutter_facebook_ui_clone/config/palette.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              brightness: Brightness.light,
              backgroundColor: Colors.white,
              title: Text(
                'facebook',
                style: TextStyle(
                  color: Palette.facebookBlue,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1.2,
                ),
              ),
              centerTitle: false,
              floating: true,
              actions: [])
        ],
      ),
    );
  }
}

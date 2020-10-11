import 'package:flutter/material.dart';
import 'package:hello/app_theme.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          drawer: Drawer(),
          appBar: AppBar(
            title: Text("Flutter Downloader"),
          ),
          backgroundColor: AppTheme.nearlyWhite,
          body: Container(
            color: AppTheme.nearlyWhite,
            child: SafeArea(
              top: false,
              bottom: false,
              child: Scaffold(
                backgroundColor: AppTheme.nearlyWhite,
                body: DrawerUserController(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final void Function() onInit;
  HomePage(this.onInit);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    widget.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}

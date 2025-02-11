import 'dart:async';
import 'package:flutter/material.dart';

class Splashpage extends StatefulWidget {
  const Splashpage({super.key});

  @override
  State<Splashpage> createState() => _SplashpageState();
}

class _SplashpageState extends State<Splashpage> {
  @override
  void initState() {
    Timer(Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(context, '/home'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: CircleAvatar(
          radius: 70,
          backgroundImage: NetworkImage(
              "https://static.vecteezy.com/system/resources/previews/020/813/574/non_2x/auction-icon-for-your-website-design-logo-app-ui-free-vector.jpg"),
        ),
      ),
    );
  }
}

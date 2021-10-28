import 'package:flutter/material.dart';
import 'package:restaurante_escola_app/core/app_images.dart';
import 'package:restaurante_escola_app/home/home_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2))
        .then((value) => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            ));
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Color(0xFF801579B)),
        child: Center(
          child: Image.asset(AppImages.logo),
        ),
      ),
    );
  }
}

import 'package:bawabetdamascus/core/constants/app_images.dart';
import 'package:bawabetdamascus/routes/app_routes.dart';
import 'package:flutter/material.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override

  @override
  void initState() {
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context, AppRoutes.login);

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(AppImages.splashBackground,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        Center(
          child: Image.asset(
            AppImages.logoApp,
            height: 300,
            width: 500,
            fit: BoxFit.scaleDown,
          ),
        ),
        ],
      ),
    );
  }
}

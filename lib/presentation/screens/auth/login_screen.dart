import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Image.asset("assets/logos/icon_app.png",
          height: 300,
          width: 500,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}

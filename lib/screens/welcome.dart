import 'package:flutter/material.dart';
import 'package:nexaya/screens/sign_in.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () {
      return Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (c) {
        return   SignIn();
      }));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff51024E),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Center(child: Image.asset("assets/images/welcome.png"))],
      ),
    );
  }
}

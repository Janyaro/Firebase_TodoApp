import 'package:flutter/material.dart';
import 'package:note_app/SplashServicd/splashServices.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashService service = SplashService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    service.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image(
          height: double.infinity,
          width: double.infinity,
          image: AssetImage('asset/splash.jpg')),
    );
  }
}

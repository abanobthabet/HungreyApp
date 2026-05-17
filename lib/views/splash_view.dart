import 'package:flutter/material.dart';
import 'package:hungry_app/core/utils/constant.dart';
import 'package:hungry_app/views/signin_view.dart';
import 'package:hungry_app/widgets/animated_splash_image.dart';
import 'package:hungry_app/widgets/animated_splash_logo.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  bool isready = false;

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 10), () {
      if (mounted) {
        setState(() {
          isready = true;
        });
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return SigninView();
              },
            ),
          );
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primrycolor,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(left: 50, top: 130, child: AnimatedSplashLogo()),
            Positioned(left: -15, bottom: -50, child: AnimatedSplashImage()),
          ],
        ),
      ),
    );
  }
}

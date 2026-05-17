import 'package:flutter/material.dart';

class AnimatedSplashImage extends StatefulWidget {
  const AnimatedSplashImage({super.key});

  @override
  State<AnimatedSplashImage> createState() => _AnimatedSplashImageState();
}

class _AnimatedSplashImageState extends State<AnimatedSplashImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.8), // زيادة المسافة لتكون النطة أوضح
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 1.0, curve: Curves.bounceOut), // تأثير النط (Bounce)
    ));

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
    );

    // تأخير بسيط ليبدأ بعد اللوجو بقليل
    Future.delayed(const Duration(milliseconds: 600), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Image.asset(
          'assets/images/hungry.png',
          height: 348,
          width: 400,
        ),
      ),
    );
  }
}

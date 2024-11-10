import 'dart:ui';

import 'package:flutter/material.dart';


import 'package:flutter/material.dart';

class AnimationDemo extends StatefulWidget {
  @override
  _AnimationDemoState createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    // Offset animation: Start below the screen and move to the center
    _offsetAnimation = Tween<Offset>(
      begin: Offset(0, 1), // Start below the screen
      end: Offset(0, 0),   // Move to the center
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // Scale animation: Start larger, and scale down to normal size
    _scaleAnimation = Tween<double>(
      begin: 1.5, // Start larger
      end: 1.0,   // End at normal size
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // Opacity animation: Change opacity from bottom to top
    _opacityAnimation = Tween<double>(
      begin: 0,   // Start fully transparent
      end: 1.0,   // End fully opaque
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            // Image with scaling and movement
            Transform.translate(
              offset: _offsetAnimation.value,
              child: Transform.scale(
                scale: _scaleAnimation.value,
                child: ClipRect(
                  child: Align(
                    alignment: Alignment.bottomCenter, // Align image to the bottom
                    heightFactor: _opacityAnimation.value, // This controls the opacity
                    child: Image.asset('assets/images/splash_screen.png'),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}




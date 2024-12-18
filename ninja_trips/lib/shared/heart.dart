import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  const Heart({Key? key}) : super(key: key);

  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  // late Animation<double> _sizeAnimation;
  late Animation<double> _scaleAnimation;
  bool favorited = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );

    _colorAnimation = ColorTween(begin: Colors.grey[400], end: Colors.red)
        .animate(_controller);

    // _sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
    //   TweenSequenceItem<double>(
    //     tween: Tween<double>(begin: 30, end: 50),
    //     weight: 50,
    //   ),
    //   TweenSequenceItem<double>(
    //     tween: Tween<double>(begin: 50, end: 30),
    //     weight: 50,
    //   ),
    // ]).animate(_controller);

    _scaleAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 1, end: 2),
        weight: 50,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 2, end: 1),
        weight: 50,
      ),
    ]).animate(_controller);

    _controller.addListener(() {
      print("Controller value: " + _controller.value.toString());
      print("Color value: " + _colorAnimation.value.toString());
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        favorited = true;
      }
      if (status == AnimationStatus.dismissed) {
        favorited = false;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return IconButton(
          icon: ScaleTransition(
            scale: _scaleAnimation,
            alignment: Alignment.center,
            child: Icon(
              Icons.favorite,
              color: _colorAnimation.value,
              size: 30,
            ),
          ),
          onPressed: () {
            favorited ? _controller.reverse() : _controller.forward();
          },
        );
      },
    );
  }
}

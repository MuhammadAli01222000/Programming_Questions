import 'package:flutter/material.dart';
import 'package:programming_questions/core/theme/dimens.dart';
import 'package:programming_questions/core/theme/strings.dart';
import 'package:programming_questions/pages/home.dart';
import 'package:programming_questions/pages/questions.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  int _currentImageIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat();

    _animation = Tween<double>(begin: 0, end: -200).animate(
      CurvedAnimation(parent: _controller, curve: Curves.ease),
    )..addListener(() {
      if (_animation.isCompleted) {
        setState(() {
          _currentImageIndex = (_currentImageIndex) % listImageUrl.length;
          _controller.reset();
          _controller.forward();
        });
      }
    });

    Future.delayed(const Duration(seconds: 10), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Questions()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: AppDimens.h250,
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 100),
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(_animation.value, 0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (int i = 0; i < listImageUrl.length; i++)
                            SizedBox(
                              width: 200,
                              height: 150,
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    listImageUrl[i],
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.home),
      ),
      body: Center(
        child: Column(
          spacing: 80,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 100,
              width: 100,
              child: CircularProgressIndicator.adaptive(strokeWidth: 4),
            ),
            SizedBox(
              width: 300,
              height: 150,
              child: Stack(
                children: [
                  AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(
                          _animation.value - (_currentImageIndex * 300),
                          0,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:bookly/Features/home_feature/presentation/views/home_view.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/assetsData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController slide_controller;
  late Animation<Offset> slide_animation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    initSlidingAnimation();
    NavigatingToHomeView();
  }

  @override
  void dispose() {
    // Dispose the animation controller to free resources
    slide_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Animate the logo sliding into view
        SlideTransition(
          position: slide_animation,
          child: Image.asset(AssetsData.logo),
        ),
        const SizedBox(
          height: 2,
        ),
        // Animate the text sliding into view
        SlideTransition(
          position: slide_animation,
          child: const Text(
            'Read Free Books',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }

  void initSlidingAnimation() {
    // Initialize the animation controller
    slide_controller = AnimationController(
      vsync: this,
      duration: const Duration(
          milliseconds: 700), // Reduced duration for smoother transition
    );

    // Define the slide animation from offset (0, 2) to offset (0, 0)
    slide_animation = Tween<Offset>(
      begin: const Offset(0, 5), // Start position: below the screen
      end: Offset.zero, // End position: original position
    ).animate(
      slide_controller,
    );

    // Start the animation
    slide_controller.forward();
  }

  void NavigatingToHomeView() {
    Future.delayed(Duration(milliseconds: 1400), () {
      Get.to(
        () => HomeView(),
        transition: Transition.fade,
        duration: ktransitionToViewDuration,
      );
    });
  }
}

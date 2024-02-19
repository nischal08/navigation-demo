import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Transition> uiList = [
      Transition.circularReveal,
      Transition.cupertino,
      Transition.cupertinoDialog,
      Transition.downToUp,
      Transition.fade,
      Transition.fadeIn,
      Transition.leftToRight,
      Transition.leftToRightWithFade,
      Transition.native,
      Transition.noTransition,
      Transition.rightToLeft,
      Transition.rightToLeftWithFade,
      Transition.size,
      Transition.topLevel,
      Transition.upToDown,
      Transition.zoom,
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Transitions'),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        padding: const EdgeInsets.all(16),
        itemCount: uiList.length,
        itemBuilder: (context, index) => SizedBox(
          height: 48,
          child: ElevatedButton(
            onPressed: () => Get.to(
              () => DestinationScreen(title: uiList[index].name.capitalize!),
              transition: uiList[index],
              duration: const Duration(milliseconds: 800),
            ),
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            child: Text(
              uiList[index].name.capitalize!,
            ),
          ),
        ),
      ),
    );
  }
}

// Define your next pages here (replace with your actual content)
class DestinationScreen extends StatelessWidget {
  final String title;
  const DestinationScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade100,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.indigoAccent,
        title: const Text('Destination Screen'),
      ),
      body: Center(
        child: Text(
          'You navigated using $title transistion animation.',
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

// ... Add similar widget definitions for other pages: LeftToRightPage, FadePage, CustomPage, ZoomPage, SlideUpPage

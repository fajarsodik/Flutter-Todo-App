import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroPage extends StatefulWidget {
  final VoidCallback onIntroEnd;
  const IntroPage({super.key, required this.onIntroEnd});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: 'welcome',
          body: 'track',
          image: Center(
            child: Icon(Icons.chair, size: 150, color: Colors.lightBlue),
          ),
        ),
        PageViewModel(
          title: 'second',
          body: 'second',
          image: Center(
            child: Icon(Icons.add, size: 150, color: Colors.lightBlue),
          ),
        ),
      ],
      onDone: widget.onIntroEnd,
      onSkip: widget.onIntroEnd,
      showSkipButton: true,
      skip: const Text("Skip"),
      next: const Icon(Icons.arrow_forward),
      done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
    );
  }
}

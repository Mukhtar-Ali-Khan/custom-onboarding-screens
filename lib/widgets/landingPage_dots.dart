import 'package:flutter/material.dart';

class LandingPageDots extends StatelessWidget {
  const LandingPageDots({Key? key, this.isActive = false}) : super(key: key);
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(right: 06),
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeIn,
      height: 7,
      width: isActive ? 35 : 15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: isActive ? Colors.orange : Colors.grey,
      ),
    );
  }
}

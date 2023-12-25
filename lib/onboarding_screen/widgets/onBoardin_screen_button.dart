import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnBoardingScreenButton extends StatelessWidget {
  const OnBoardingScreenButton({
    Key? key,
    this.color = Colors.transparent,
    this.enableBorder = false,
    required this.buttonName,
    required this.onTap,
  }) : super(key: key);
  final Color color;
  final bool enableBorder;
  final String buttonName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MaterialButton(
      onPressed: () {
        HapticFeedback.lightImpact();
        onTap();
      },
      elevation: 2,
      height: 50,
      minWidth: size.width - 60,
      color: color,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: enableBorder
              ? const BorderSide(color: Colors.white, width: 1)
              : BorderSide.none),
      child: Text(
        buttonName,
        style: const TextStyle(
            fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white),
      ),
    );
  }
}

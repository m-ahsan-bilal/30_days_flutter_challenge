import 'package:flutter/material.dart';

class DayButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const DayButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    // MediaQuery to make the button responsive to different screen sizes
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: InkWell(
        onTap: onPressed,
        splashColor: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(15),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          height: screenWidth < 400
              ? 80
              : 100, // Adjust height based on screen size
          width: screenWidth * 0.9, // Button width is 90% of screen width
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Colors.blueGrey, Colors.grey],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                offset: const Offset(0, 4),
                blurRadius: 15,
              ),
            ],
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

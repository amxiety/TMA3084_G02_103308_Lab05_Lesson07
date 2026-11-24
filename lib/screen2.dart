import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Alarm Screen',
        style: TextStyle(fontSize: 40, color: Colors.blue, fontWeight: FontWeight.bold),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const GestureApp());
}

class GestureApp extends StatelessWidget {
  const GestureApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gesture Demo',
      home: const GestureHome(),
    );
  }
}

class GestureHome extends StatefulWidget {
  const GestureHome({super.key});

  @override
  State<GestureHome> createState() => _GestureHomeState();
}

class _GestureHomeState extends State<GestureHome> {
  String message = "Tap or Long Press the box";
  Color boxColor = Colors.blue;

  void tapAction() {
    setState(() {
      message = "You tapped the box!";
      boxColor = Colors.green;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Tap detected!")),
    );
  }

  void longPressAction() {
    setState(() {
      message = "Long Press detected!";
      boxColor = Colors.orange;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Long Press detected!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gesture Controlled App"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: GestureDetector(
          onTap: tapAction,
          onLongPress: longPressAction,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              color: boxColor,
              borderRadius: BorderRadius.circular(20),
            ),
            alignment: Alignment.center,
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
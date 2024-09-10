import 'package:flutter/material.dart';

class AddGuide extends StatefulWidget {
  static const id = "Add guide";
  const AddGuide({super.key});

  @override
  State<AddGuide> createState() => _AddGuideState();
}

class _AddGuideState extends State<AddGuide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
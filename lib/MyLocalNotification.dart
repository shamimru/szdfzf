import 'package:flutter/material.dart';

class Mylocalnotification extends StatefulWidget {
  const Mylocalnotification({super.key});

  @override
  State<Mylocalnotification> createState() => _MylocalnotificationState();
}

class _MylocalnotificationState extends State<Mylocalnotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text("My Notification"),
      ),
      body: Text("hello"),
    );
  }
}

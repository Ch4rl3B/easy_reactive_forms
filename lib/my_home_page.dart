import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ElevatedButton(
              key: const Key('flutter_example'),
              onPressed: onFlutterPressed,
              child: const Text('Flutter Form example'),
            ),
            ElevatedButton(
              key: const Key('reactive_example'),
              onPressed: onReactivePressed,
              child: const Text('Reactive Form example'),
            ),
          ],
        ),
      ),
    );
  }

  void onFlutterPressed() {}

  void onReactivePressed() {}
}

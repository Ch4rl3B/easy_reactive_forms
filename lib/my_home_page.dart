import 'package:easy_reactive_forms/flutter_form_example.dart';
import 'package:easy_reactive_forms/reactive_form_example.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Easy Reactive Forms'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ElevatedButton(
              key: const Key('flutter_example'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (_) => const FlutterFormExample(),
                  ),
                );
              },
              child: const Text('Flutter Form example'),
            ),
            ElevatedButton(
              key: const Key('reactive_example'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (_) => const ReactiveFormExample(),
                  ),
                );
              },
              child: const Text('Reactive Form example'),
            ),
          ],
        ),
      ),
    );
  }
}

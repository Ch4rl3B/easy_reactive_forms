import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ReactiveFormExample extends StatefulWidget {
  const ReactiveFormExample({super.key});

  @override
  createState() => _ReactiveFormExampleState();
}

class _ReactiveFormExampleState extends State<ReactiveFormExample> {

  final _form = FormGroup({});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reactive Form Example'),
      ),
      body: ReactiveForm(
        formGroup: _form,
        child: Column(
          children: const <Widget>[
            // Add ReactiveTextField and ElevatedButton here.
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ReactiveFormExample extends StatefulWidget {
  const ReactiveFormExample({super.key});

  @override
  createState() => _ReactiveFormExampleState();
}

class _ReactiveFormExampleState extends State<ReactiveFormExample> {

  final _form = FormGroup({
    'text': FormControl<String>(
      validators: [Validators.required],
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reactive Form Example'),
      ),
      body: ReactiveForm(
        formGroup: _form,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 24,
          ),
          child: Column(
            children: <Widget>[
              ReactiveTextField<String>(
                formControlName: 'text',
                validationMessages: (_) => {
                  ValidationMessage.required : 'Please enter some text'
                },
              ),
              // Add ElevatedButton here.
            ],
          ),
        ),
      ),
    );
  }
}

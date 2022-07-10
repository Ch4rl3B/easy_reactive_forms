import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ReactiveFormExample extends StatefulWidget {
  const ReactiveFormExample({super.key});

  @override
  createState() => _ReactiveFormExampleState();
}

class _ReactiveFormExampleState extends State<ReactiveFormExample> {
  final _form = FormGroup({
    'nickname': FormControl<String>(),
    'email': FormControl<String>(),
    'comment': FormControl<String>(),
    'radio': FormControl<bool>(),
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
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ReactiveTextField<String>(
                  key: const Key('nickname'),
                  formControlName: 'nickname',
                  decoration: const InputDecoration(
                    label: Text('Nickname'),
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                ReactiveTextField<String>(
                  key: const Key('email'),
                  formControlName: 'email',
                  decoration: const InputDecoration(
                    label: Text('Email'),
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                ReactiveTextField<String>(
                  key: const Key('comment'),
                  formControlName: 'comment',
                  decoration: const InputDecoration(
                    label: Text('Comment'),
                    prefixIcon: Icon(Icons.textsms),
                  ),
                  minLines: 5,
                  maxLines: 5,
                ),
                const SizedBox(
                  height: 4,
                ),
                ReactiveCheckboxListTile(
                  key: const Key('radio'),
                  formControlName: 'radio',
                  title: const Text('Accept terms and conditions'),
                ),
                const SizedBox(
                  height: 4,
                ),
                ReactiveFormConsumer(
                  key: const Key('submit'),
                  builder: (context, form, _) => ElevatedButton(
                    onPressed: () {},
                    child: const Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

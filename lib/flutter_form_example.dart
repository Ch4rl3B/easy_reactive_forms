import 'package:flutter/material.dart';

class FlutterFormExample extends StatefulWidget {
  const FlutterFormExample({super.key});

  @override
  createState() => _FlutterFormExampleState();
}

class _FlutterFormExampleState extends State<FlutterFormExample> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();
  bool radio = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Form Example'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 24,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                  key: const Key("nickname"),
                  decoration: const InputDecoration(
                    label: Text('Nickname'),
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    if (value.length < 3) {
                      return 'Incorrect pattern: at least 3 characters';
                    }
                    final pattern = RegExp(r'^([^\x00-\x7F]|[\w_\.\-]){3,16}$');
                    if (!pattern.hasMatch(value)) {
                      return 'Incorrect pattern: invalid characters';
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  maxLength: 16,
                ),
                const SizedBox(height: 4),
                TextFormField(
                  key: const Key("email"),
                  decoration: const InputDecoration(
                    label: Text('Email'),
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    final pattern = RegExp(r'.+\@.+\..+');
                    if (!pattern.hasMatch(value)) {
                      return 'Incorrect pattern: invalid email';
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 4),
                TextFormField(
                  key: const Key("comment"),
                  decoration: const InputDecoration(
                    label: Text('Comment'),
                    prefixIcon: Icon(Icons.textsms),
                  ),
                  maxLines: 5,
                  maxLength: 120,
                ),
                const SizedBox(height: 4),
                CheckboxListTile(
                  key: const Key('radio'),
                  title: const Text('Accept terms and conditions'),
                  onChanged: (value) {
                    setState(() {
                      radio = value ?? false;
                    });
                  },
                  value: radio,
                ),
                const SizedBox(height: 4),
                ElevatedButton(
                  key: const Key('submit'),
                  onPressed: () {
                    if (_formKey.currentState!.validate() && radio) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Processing Data'),
                          backgroundColor: Colors.greenAccent,
                        ),
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ReactiveFormExample extends StatefulWidget {
  const ReactiveFormExample({super.key});

  @override
  createState() => _ReactiveFormExampleState();
}

class _ReactiveFormExampleState extends State<ReactiveFormExample> {
  final _form = FormGroup({
    'nickname': FormControl<String>(
      validators: [
        Validators.required,
        Validators.minLength(3),
        Validators.pattern(r'^([^\x00-\x7F]|[\w_\.\-]){3,16}$'),
      ],
    ),
    'email': FormControl<String>(
      validators: [Validators.required, Validators.email],
    ),
    'comment': FormControl<String>(),
    'radio': FormControl<bool>(validators: [Validators.requiredTrue]),
  });

  @override
  Widget build(BuildContext context) {
    print('${DateTime.now()}: ReactiveFormExample built');
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
                  validationMessages: (_) => {
                    ValidationMessage.required: 'Please enter some text',
                    ValidationMessage.minLength:
                        'Incorrect pattern: at least 3 characters',
                    ValidationMessage.pattern:
                        'Incorrect pattern: invalid characters',
                  },
                ),
                const SizedBox(height: 4),
                ReactiveTextField<String>(
                  key: const Key('email'),
                  formControlName: 'email',
                  decoration: const InputDecoration(
                    label: Text('Email'),
                    prefixIcon: Icon(Icons.email),
                  ),
                  validationMessages: (_) => {
                    ValidationMessage.required: 'Please enter some text',
                    ValidationMessage.email: 'Incorrect pattern: invalid email',
                  },
                ),
                const SizedBox(height: 4),
                ReactiveTextField<String>(
                  key: const Key('comment'),
                  formControlName: 'comment',
                  decoration: const InputDecoration(
                    label: Text('Comment'),
                    prefixIcon: Icon(Icons.textsms),
                  ),
                  maxLines: 5,
                  maxLength: 120,
                ),
                const SizedBox(height: 4),
                ReactiveCheckboxListTile(
                  key: const Key('radio'),
                  formControlName: 'radio',
                  title: const Text('Accept terms and conditions'),
                ),
                const SizedBox(height: 4),
                ReactiveFormConsumer(
                  key: const Key('submit'),
                  builder: (context, form, _) => ElevatedButton(
                    onPressed: form.valid ? () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Nickname: ${form.value['nickname']}'),
                                Text('Email: ${form.value['email']}'),
                                Text('Comment: ${form.value['comment']}'),
                              ],
                            ),
                            backgroundColor: Colors.greenAccent,
                          ),
                        );
                    } : null,
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

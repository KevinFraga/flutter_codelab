import 'package:codelab/animated_progress_bar.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final username = TextEditingController();

  double progress = 0;

  void login() {
    Navigator.of(context).pushNamed('/logged_in');
  }

  void updateProgress() {
    var prog = 0.0;
    final controllers = [firstname, lastname, username];

    for (final controller in controllers) {
      if (controller.value.text.isNotEmpty) {
        prog += 1 / controllers.length;
      }
    }

    setState(() {
      progress = prog;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: updateProgress,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedProgressBar(value: progress),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              'Sign Up',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextFormField(
              controller: firstname,
              decoration: const InputDecoration(
                hintText: 'First name:',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextFormField(
              controller: lastname,
              decoration: const InputDecoration(
                hintText: 'Last name:',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextFormField(
              controller: username,
              decoration: const InputDecoration(
                hintText: 'User name:',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.resolveWith((states) {
                  return states.contains(MaterialState.disabled)
                      ? null
                      : Colors.blue;
                }),
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  return states.contains(MaterialState.disabled)
                      ? null
                      : Colors.blue;
                }),
              ),
              onPressed: progress == 1 ? login : null,
              child: Text(
                'Sign In',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

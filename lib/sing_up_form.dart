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

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LinearProgressIndicator(value: progress),
          Text(
            'Sign Up',
            style: Theme.of(context).textTheme.headlineMedium,
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
          TextButton(
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
            onPressed: null,
            child: const Text('Sign In'),
          )
        ],
      ),
    );
  }
}

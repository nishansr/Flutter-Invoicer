import 'package:flutter/material.dart';
import 'package:invoicer/view/components/my_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/logos/reev_logo.png',
          ),
          const Text(
            'Your Invoicing Partner',
            style: TextStyle(fontSize: 35.0),
          ),
        ],
      ),
      bottomNavigationBar: MyButton(
        text: 'Continue',
        textColor: Colors.white,
        color: Colors.black,
        onTap: () {
          Navigator.pushReplacementNamed(context, '/home');
        },
      ),
    );
  }
}

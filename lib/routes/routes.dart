import 'package:flutter/material.dart';
import 'package:invoicer/view/Invoicing/add_items.dart';
import 'package:invoicer/view/home/home_screen.dart';
import 'package:invoicer/view/home/widgets/saved_invoice_screen.dart';
import 'package:invoicer/view/onboarding/onboarding_screen.dart';
import 'package:invoicer/view/result/invoice_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/add':
        return MaterialPageRoute(builder: (_) => const AddItems());
      case '/result':
        return MaterialPageRoute(builder: (_) => const ResultScreen());
      case '/saved_result':
        final dynamic args = settings.arguments;
        return MaterialPageRoute(builder: (_) => SavedResultScreen(user: args,));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error Route'),
          centerTitle: true,
        ),
        body: const Center(
          child: Text('Sorry, no route found!'),
        ),
      ),
    );
  }
}
